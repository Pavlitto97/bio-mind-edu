// @ts-check
const { test, expect, devices } = require('@playwright/test');

/**
 * Local iPhone SE Testing
 * Run this against localhost:8080 to verify fixes before deployment
 */

const LOCAL_URL = process.env.TEST_URL || 'http://localhost:8080';

// Configure iPhone SE viewport at the top level
test.use({ ...devices['iPhone SE'] });

test.describe('Local iPhone SE Testing', () => {

  test('AppBar should show lesson title not TITLE', async ({ page }) => {
    console.log('🧪 Testing AppBar title...');
    
    await page.goto(LOCAL_URL);
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(2000);

    // Navigate to Cell lesson
    const cellButton = page.locator('text=/cell/i').first();
    await cellButton.click();
    await page.waitForTimeout(2000);

    // Navigate to interactive task
    const continueButton = page.locator('text=/continue/i').first();
    const hasContinue = await continueButton.isVisible({ timeout: 5000 }).catch(() => false);
    
    if (hasContinue) {
      await continueButton.click();
      await page.waitForTimeout(2000);
    }

    // Take screenshot
    await page.screenshot({ 
      path: 'tests/screenshots/local-appbar-iphone-se.png',
      fullPage: false 
    });

    // Check AppBar text
    const appBar = page.locator('header').first();
    const appBarText = await appBar.textContent();
    
    console.log(`AppBar text: "${appBarText}"`);
    
    // Should contain "Cell Structure", not "TITLE" or "Lesson"
    expect(appBarText).toContain('Cell Structure');
    expect(appBarText).not.toContain('TITLE');
    
    console.log('✅ AppBar shows correct lesson title');
  });

  test('Draggable items should be visible on iPhone SE', async ({ page }) => {
    console.log('🧪 Testing draggable items visibility...');
    
    await page.goto(LOCAL_URL);
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(2000);

    // Navigate to interactive task
    await page.click('text=/cell/i');
    await page.waitForTimeout(2000);
    
    const continueButton = page.locator('text=/continue/i').first();
    if (await continueButton.isVisible({ timeout: 5000 }).catch(() => false)) {
      await continueButton.click();
      await page.waitForTimeout(2000);
    }

    // Take full screenshot
    await page.screenshot({ 
      path: 'tests/screenshots/local-interactive-iphone-se.png',
      fullPage: true 
    });

    // Get viewport size
    const viewport = page.viewportSize();
    console.log(`Viewport: ${viewport?.width}x${viewport?.height}`);

    // Find draggable items
    const draggables = await page.locator('[draggable="true"]').all();
    console.log(`Found ${draggables.length} draggable items`);

    if (draggables.length === 0) {
      console.error('❌ No draggable items found!');
      expect(draggables.length).toBeGreaterThan(0);
      return;
    }

    // Check each item's position
    for (let i = 0; i < draggables.length; i++) {
      const item = draggables[i];
      const box = await item.boundingBox();
      
      if (box) {
        const isVisible = box.y >= 0 && 
                         box.y + box.height <= (viewport?.height || 667) &&
                         box.x >= 0 && 
                         box.x + box.width <= (viewport?.width || 375);
        
        console.log(`Item ${i + 1}:`, {
          x: Math.round(box.x),
          y: Math.round(box.y),
          width: Math.round(box.width),
          height: Math.round(box.height),
          visible: isVisible ? '✅' : '❌'
        });
        
        expect(isVisible).toBe(true);
      } else {
        console.error(`❌ Item ${i + 1} has no bounding box`);
      }
    }

    console.log('✅ All items are within viewport');
  });

  test('Drop zones should be visible', async ({ page }) => {
    console.log('🧪 Testing drop zones visibility...');
    
    await page.goto(LOCAL_URL);
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(2000);

    await page.click('text=/cell/i');
    await page.waitForTimeout(2000);
    
    const continueButton = page.locator('text=/continue/i').first();
    if (await continueButton.isVisible({ timeout: 5000 }).catch(() => false)) {
      await continueButton.click();
      await page.waitForTimeout(2000);
    }

    // Find all containers (drop zones)
    const containers = await page.locator('*').evaluateAll((elements) => {
      return elements
        .filter(el => {
          const style = window.getComputedStyle(el);
          return style.border !== 'none' && 
                 style.border !== '' &&
                 el.offsetWidth > 40 &&
                 el.offsetHeight > 40;
        })
        .map(el => {
          const rect = el.getBoundingClientRect();
          const style = window.getComputedStyle(el);
          return {
            width: Math.round(rect.width),
            height: Math.round(rect.height),
            x: Math.round(rect.x),
            y: Math.round(rect.y),
            border: style.border,
            background: style.backgroundColor
          };
        });
    });

    console.log(`Found ${containers.length} potential drop zones`);
    containers.slice(0, 5).forEach((zone, i) => {
      console.log(`Zone ${i + 1}:`, zone);
    });

    expect(containers.length).toBeGreaterThan(0);
    console.log('✅ Drop zones detected');
  });

  test('Layout should fit in viewport', async ({ page }) => {
    console.log('🧪 Testing overall layout...');
    
    await page.goto(LOCAL_URL);
    await page.waitForLoadState('networkidle');
    await page.waitForTimeout(2000);

    await page.click('text=/cell/i');
    await page.waitForTimeout(2000);
    
    const continueButton = page.locator('text=/continue/i').first();
    if (await continueButton.isVisible({ timeout: 5000 }).catch(() => false)) {
      await continueButton.click();
      await page.waitForTimeout(2000);
    }

    const viewport = page.viewportSize();
    const bodyHeight = await page.evaluate(() => document.body.scrollHeight);
    
    console.log('Layout info:');
    console.log(`  Viewport: ${viewport?.width}x${viewport?.height}`);
    console.log(`  Content height: ${bodyHeight}px`);
    
    if (bodyHeight > (viewport?.height || 667)) {
      const overflow = bodyHeight - (viewport?.height || 667);
      console.log(`  ⚠️  Content overflows by ${overflow}px`);
    } else {
      console.log('  ✅ Content fits in viewport');
    }

    // Check if important elements are visible
    const progress = await page.locator('text=/progress/i').first().isVisible();
    const hint = await page.locator('text=/hint/i').first().isVisible();
    const reset = await page.locator('text=/reset/i').first().isVisible();
    
    console.log('Visible elements:');
    console.log(`  Progress: ${progress ? '✅' : '❌'}`);
    console.log(`  Hint button: ${hint ? '✅' : '❌'}`);
    console.log(`  Reset button: ${reset ? '✅' : '❌'}`);
    
    expect(progress).toBe(true);
    expect(hint).toBe(true);
    expect(reset).toBe(true);
  });
});

// Quick test to verify server is running
test('Local server is accessible', async ({ page }) => {
  console.log('\n🌐 Testing local server...');
  
  try {
    await page.goto(LOCAL_URL, { timeout: 5000 });
    console.log('✅ Server is running');
  } catch (error) {
    console.error('❌ Server not accessible!');
    console.error('Please run: cd biomind_edu/build/web && python3 -m http.server 8080');
    throw error;
  }
});
