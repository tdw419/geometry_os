/**
 * Evolution Experiment: Autonomous Optimization
 * 
 * Demonstrates the AI's ability to optimize code safely.
 * Uses the EvolutionSafetySystem as a guardrail.
 */

import { EvolutionSafetySystem } from './evolution_safety.js';

export class EvolutionExperiment {
    constructor() {
        this.safety = new EvolutionSafetySystem();
        this.baselineCode = `
            function compute(maxIter) {
                // Baseline: Slow O(N^2) sort for demo or heavy calc
                let arr = [];
                for(let i=0; i<1000; i++) arr.push(Math.random());
                
                // Bubble sort (Slow)
                for(let i=0; i<arr.length; i++) {
                    for(let j=0; j<arr.length-i-1; j++) {
                        if(arr[j] > arr[j+1]) {
                            let temp = arr[j];
                            arr[j] = arr[j+1];
                            arr[j+1] = temp;
                        }
                    }
                }
                return arr[0];
            }
            return compute(1000);
        `;

        this.generations = [];
        this.currentGen = 0;
    }

    /**
     * Run one generation of evolution
     * @param {string} mutationType - 'optimize' | 'break' | 'slow'
     */
    async runGeneration(mutationType = 'optimize') {
        const genId = this.currentGen++;
        let candidateCode = this.baselineCode;
        let diff = "No change";

        // Mock LLM "Mutation"
        if (mutationType === 'optimize') {
            // Replace Bubble Sort with Native Sort (Fast)
            candidateCode = `
                function compute(maxIter) {
                    let arr = [];
                    for(let i=0; i<1000; i++) arr.push(Math.random());
                    arr.sort((a,b) => a-b); // Optimized
                    return arr[0];
                }
                return compute(1000);
            `;
            diff = "Optimized: Bubble Sort -> Native Sort";
        } else if (mutationType === 'break') {
            // Syntax error
            candidateCode = `function compute( { return 0; }`;
            diff = "Broken: Syntax Error";
        } else if (mutationType === 'infinite') {
            // Infinite Loop
            candidateCode = `while(true) {}; return 0;`;
            diff = "Broken: Infinite Loop";
        } else if (mutationType === 'slow') {
            // Even Slower
            candidateCode = `
                function compute() {
                   let i=0;
                   while(i<100000000) i++; // Waste time
                   return i;
                }
                return compute();
             `;
            diff = "Regressed: Added busy wait";
        }

        // Evaluate via Safety System
        const start = performance.now();
        const result = await this.safety.evaluate(candidateCode);
        const duration = performance.now() - start;

        const record = {
            id: genId,
            diff: diff,
            accepted: result.accepted,
            reason: result.reason || 'Fitness Improved', // Mock reason if accepted
            duration: duration.toFixed(2) + 'ms',
            version: result.version
        };

        this.generations.push(record);
        return record;
    }
}
