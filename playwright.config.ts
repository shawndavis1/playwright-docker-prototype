import { defineConfig } from '@playwright/test';

export default defineConfig({
  testDir: './tests',
  fullyParallel: true,
  retries: 0,
  outputDir: 'test-results',
  reporter: [
  ['list'], // console output
  ['html', { outputFolder: 'playwright-report', open: 'never' }],
  ['junit', { outputFile: 'test-results/results.xml' }],
  ],
  projects: [
  { name: 'chromium', use: { browserName: 'chromium' }},
  { name: 'msedge', use: { channel: 'msedge' }}
],
});