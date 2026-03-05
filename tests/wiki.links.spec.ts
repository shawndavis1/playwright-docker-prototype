import { test, expect } from '@playwright/test';

test('Wikipedia homepage title', async ({ page }) => {
  // Navigate to Wikipedia
  await page.goto('https://www.wikipedia.org/');

  // Assert the page title contains "Wikipedia"
  await expect(page).toHaveTitle(/Wikipedia/);
});

test('Wikipedia English link works', async ({ page }) => {
  await page.goto('https://www.wikipedia.org/');
  const englishLink = page.locator('a#js-link-box-en');
  await expect(englishLink).toBeVisible();
  await englishLink.click();
  await expect(page).toHaveURL(/en.wikipedia.org/);
});