#!/usr/bin/env python3
"""
Train the Holographic Perception Agent on synthetic interference patterns.
"""

import numpy as np
import torch
import torch.nn as nn
import torch.optim as optim
from torch.utils.data import Dataset, DataLoader
import os
import sys

# Import the existing model and generator
from holographic_perception_agent import InterferencePerceiver, HolographicPerceptionAgent
from holographic_blue_kernel import encode_holographic_instruction
from systems.pixel_compiler.holographic_encoder import generate_2d_basis

class HolographicDataset(Dataset):
    def __init__(self, num_samples=1000, basis=None):
        self.num_samples = num_samples
        self.basis = basis if basis is not None else generate_2d_basis(16, 64)
        
        # Instruction types
        self.instruction_types = [
            (0x37, 'LUI', 0),        # 0: balanced
            (0x13, 'OP_IMM', 120),   # 1: green/blue shifted
            (0x23, 'STORE', 240),    # 2: blue dominant
            (0x03, 'LOAD', 60),      # 3: red/green shifted
            (0x33, 'OP', 0)          # 4: balanced
        ]
        
    def __len__(self):
        return self.num_samples
        
    def __getitem__(self, idx):
        # Randomly select an instruction type
        type_idx = np.random.randint(len(self.instruction_types))
        opcode, name, base_phase = self.instruction_types[type_idx]
        
        # Generate random 32-bit instruction with this opcode
        rand_val = np.random.randint(0, 0x1000000)
        instr = (rand_val << 7) | opcode
        
        # Determine actual phase (add some noise)
        phase = (base_phase + np.random.normal(0, 5)) % 360
        
        # Generate RGBA glyph
        r = encode_holographic_instruction(instr, self.basis, 0)
        g = encode_holographic_instruction(instr, self.basis, 120)
        b = encode_holographic_instruction(instr, self.basis, 240)
        a = (r + g + b) / 3.0
        
        # Convert to tensor [4, 16, 16]
        glyph = np.stack([r, g, b, a], axis=0)
        glyph_tensor = torch.from_numpy(glyph).float()
        
        # Target bits (for regression)
        bits = np.array([(1.0 if (instr >> i) & 1 else 0.0) for i in range(32)], dtype=np.float32)
        bits_tensor = torch.from_numpy(bits)
        
        # Map to the 12 classes of InterferencePerceiver
        # 'LUI': 0, 'OP_IMM': 7, 'STORE': 6, 'LOAD': 5, 'OP': 8
        class_mapping = {0x37: 0, 0x13: 7, 0x23: 6, 0x03: 5, 0x33: 8}
        target_class = class_mapping[opcode]
        
        return glyph_tensor, target_class, bits_tensor

def train_agent():
    print("Initializing training for Holographic Perception Agent...")
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    print(f"Using device: {device}")
    
    # Initialize model
    model = InterferencePerceiver(num_classes=12).to(device)
    
    # Generate datasets
    print("Generating synthetic datasets...")
    basis = generate_2d_basis(16, 64)
    train_dataset = HolographicDataset(num_samples=10000, basis=basis)
    val_dataset = HolographicDataset(num_samples=1000, basis=basis)
    
    train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
    val_loader = DataLoader(val_dataset, batch_size=64)
    
    # Loss functions and optimizer
    criterion_class = nn.CrossEntropyLoss()
    criterion_bits = nn.BCELoss()  # Binary Cross Entropy for bits
    optimizer = optim.Adam(model.parameters(), lr=0.001)
    
    num_epochs = 5
    best_val_acc = 0.0
    
    print(f"Starting training for {num_epochs} epochs...")
    for epoch in range(num_epochs):
        model.train()
        total_loss = 0
        correct_class = 0
        total_samples = 0
        
        for glyphs, target_class, target_bits in train_loader:
            glyphs = glyphs.to(device)
            target_class = target_class.to(device)
            target_bits = target_bits.to(device)
            
            optimizer.zero_grad()
            
            class_logits, bit_values, _ = model(glyphs)
            
            loss_class = criterion_class(class_logits, target_class)
            loss_bits = criterion_bits(bit_values, target_bits)
            
            # Combine losses
            loss = loss_class + 0.5 * loss_bits
            
            loss.backward()
            optimizer.step()
            
            total_loss += loss.item()
            
            # Track accuracy
            preds = class_logits.argmax(dim=-1)
            correct_class += (preds == target_class).sum().item()
            total_samples += target_class.size(0)
            
        train_acc = correct_class / total_samples
        
        # Validation
        model.eval()
        val_correct = 0
        val_total = 0
        with torch.no_grad():
            for glyphs, target_class, _ in val_loader:
                glyphs = glyphs.to(device)
                target_class = target_class.to(device)
                
                class_logits, _, _ = model(glyphs)
                preds = class_logits.argmax(dim=-1)
                val_correct += (preds == target_class).sum().item()
                val_total += target_class.size(0)
                
        val_acc = val_correct / val_total
        print(f"Epoch {epoch+1}/{num_epochs} | Loss: {total_loss/len(train_loader):.4f} | Train Acc: {train_acc:.4f} | Val Acc: {val_acc:.4f}")
        
        if val_acc > best_val_acc:
            best_val_acc = val_acc
            torch.save(model.state_dict(), "holographic_perception_model.pth")
            print("  -> Saved new best model!")
            
    print("Training complete. Verifying against the Blue Kernel...")
    
    # Run the agent with the trained model
    agent = HolographicPerceptionAgent(model_path="holographic_perception_model.pth")
    explanation = agent.explain_kernel('/tmp/holographic_blue_kernel.png')
    print("\n--- Final Model Output ---")
    print(explanation)

if __name__ == "__main__":
    train_agent()
