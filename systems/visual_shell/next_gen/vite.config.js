import { defineConfig } from 'vite';
import path from 'path';

export default defineConfig({
  resolve: {
    alias: {
      '@geometry-os/ui': path.resolve(__dirname, '../../sdk/packages/ui/src/index.js')
    }
  },
  build: {
    target: 'esnext'
  }
});
