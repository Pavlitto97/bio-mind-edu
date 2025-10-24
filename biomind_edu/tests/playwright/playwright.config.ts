import { defineConfig, devices } from '@playwright/test';

export default defineConfig({
  testDir: './',
  fullyParallel: true,
  forbidOnly: !!process.env.CI,
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 1 : undefined,
  reporter: 'html',
  
  use: {
    // Use production URL for testing deployed app
    baseURL: process.env.TEST_URL || 'https://pavlitto97.github.io/bio-mind-edu/',
    trace: 'on-first-retry',
    screenshot: 'only-on-failure',
  },

  projects: [
    {
      name: 'iPhone SE',
      use: { ...devices['iPhone SE'] },
    },
    {
      name: 'Pixel 7',
      use: {
        viewport: { width: 412, height: 915 },
        userAgent: 'Mozilla/5.0 (Linux; Android 13) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Mobile Safari/537.36',
      },
    },
    {
      name: 'iPad Mini',
      use: { ...devices['iPad Mini'] },
    },
    {
      name: 'Desktop',
      use: {
        viewport: { width: 1920, height: 1080 },
      },
    },
  ],

  // Disable webServer when testing production
  // webServer: {
  //   command: 'cd ../.. && flutter run -d chrome --web-port=8080',
  //   url: 'http://localhost:8080',
  //   reuseExistingServer: !process.env.CI,
  //   timeout: 120000,
  // },
});
