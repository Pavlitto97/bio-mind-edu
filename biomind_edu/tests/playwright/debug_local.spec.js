// @ts-check
const { test, devices } = require('@playwright/test');

const LOCAL_URL = process.env.TEST_URL || 'http://localhost:8080';

test.use({ ...devices['iPhone SE'] });

test('Debug - What is on the page?', async ({ page }) => {
  console.log('\n🔍 Debugging local page...');
  
  // Listen for console messages
  page.on('console', msg => {
    const type = msg.type();
    if (type === 'error' || type === 'warning') {
      console.log(`[${type.toUpperCase()}] ${msg.text()}`);
    }
  });

  // Listen for page errors
  page.on('pageerror', error => {
    console.log(`[PAGE ERROR] ${error.message}`);
  });
  
  await page.goto(LOCAL_URL);
  await page.waitForLoadState('networkidle');
  console.log('⏱️  Waiting 10 seconds for Flutter to load...');
  await page.waitForTimeout(10000); // Wait longer for Flutter

  // Take a screenshot
  await page.screenshot({ 
    path: 'debug-homepage.png',
    fullPage: true 
  });

  // Get all text content
  const allText = await page.evaluate(() => {
    return Array.from(document.querySelectorAll('*'))
      .map(el => el.textContent?.trim())
      .filter(text => text && text.length > 0 && text.length < 100)
      .slice(0, 20);
  });

  console.log('\n📄 Text on page:');
  allText.forEach(text => console.log(`  - "${text}"`));

  // Get all buttons
  const buttons = await page.evaluate(() => {
    return Array.from(document.querySelectorAll('button, [role="button"], a'))
      .map(el => ({
        text: el.textContent?.trim(),
        tag: el.tagName,
        visible: el.offsetHeight > 0
      }))
      .filter(btn => btn.text && btn.text.length > 0);
  });

  console.log('\n🔘 Buttons/Links on page:');
  buttons.forEach(btn => console.log(`  ${btn.visible ? '✅' : '❌'} [${btn.tag}] "${btn.text}"`));

  // Check for lessons
  const hasCell = await page.locator('text=/cell/i').count();
  const hasЦелКлітина = await page.locator('text=/клітин/i').count();
  const hasStructure = await page.locator('text=/structure/i').count();

  console.log('\n🔎 Looking for lesson text:');
  console.log(`  "cell" (English): ${hasCell} matches`);
  console.log(`  "клітин" (Ukrainian): ${hasЦелКлітина} matches`);
  console.log(`  "structure": ${hasStructure} matches`);

  console.log('\n✅ Debug complete. Check debug-homepage.png');
});
