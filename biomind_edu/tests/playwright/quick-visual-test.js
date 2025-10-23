/**
 * Quick Visual Test for Responsive Interactive Tasks
 * Opens the app in different viewport sizes and takes screenshots
 */

const { chromium } = require('playwright');

async function quickTest() {
  console.log('🚀 Запуск швидкого візуального тесту...\n');
  
  const browser = await chromium.launch({ 
    headless: false,
    slowMo: 1000 // Slow down for demonstration
  });
  
  const devices = [
    { name: 'iPhone SE', width: 375, height: 667 },
    { name: 'Pixel 7', width: 412, height: 915 }
  ];
  
  for (const device of devices) {
    console.log(`\n📱 Тестування ${device.name}...`);
    
    const context = await browser.newContext({
      viewport: { width: device.width, height: device.height },
    });
    
    const page = await context.newPage();
    
    try {
      await page.goto('http://localhost:8080', { timeout: 30000 });
      console.log('  ✅ Сторінка завантажена');
      
      await page.waitForTimeout(3000);
      
      // Measure viewport
      const viewport = page.viewportSize();
      console.log(`  📐 Viewport: ${viewport.width}×${viewport.height}`);
      
      // Check for content overflow
      const contentHeight = await page.evaluate(() => document.body.scrollHeight);
      console.log(`  📏 Content height: ${contentHeight}px`);
      
      if (contentHeight > viewport.height) {
        console.log(`  ⚠️  Content може потребувати прокрутки`);
      } else {
        console.log(`  ✅ Content вміщується у viewport`);
      }
      
      // Count visible elements
      const images = await page.locator('img').count();
      const buttons = await page.locator('button').count();
      console.log(`  🖼️  Зображень: ${images}`);
      console.log(`  🔘 Кнопок: ${buttons}`);
      
      // Try to navigate to lesson
      console.log('  🔍 Пошук уроку...');
      const lessonFound = await page.locator('text=/Cell|Клітина/i').first().isVisible({ timeout: 5000 }).catch(() => false);
      
      if (lessonFound) {
        console.log('  ✅ Урок знайдено');
        await page.locator('text=/Cell|Клітина/i').first().click();
        await page.waitForTimeout(2000);
        
        // Look for interactive task
        const taskButton = await page.locator('text=/Interactive|Інтерактивн/i').first().isVisible({ timeout: 3000 }).catch(() => false);
        
        if (taskButton) {
          console.log('  ✅ Кнопка інтерактивного завдання знайдена');
          await page.locator('text=/Interactive|Інтерактивн/i').first().click();
          await page.waitForTimeout(3000);
          
          // Check task elements
          const taskImages = await page.locator('img[src*="assets"]').count();
          const taskButtons = await page.locator('button').count();
          
          console.log(`  🎮 Елементів гри: ${taskImages}`);
          console.log(`  🔘 Кнопок керування: ${taskButtons}`);
          
          // Check if elements are within viewport
          const allImages = await page.locator('img[src*="assets"]').all();
          let visibleCount = 0;
          
          for (const img of allImages) {
            const box = await img.boundingBox();
            if (box && box.y + box.height <= viewport.height) {
              visibleCount++;
            }
          }
          
          console.log(`  👁️  Видимих зображень: ${visibleCount}/${taskImages}`);
          
          if (visibleCount === taskImages) {
            console.log(`  ✅✅✅ ВСІ ЕЛЕМЕНТИ ВИДИМІ!`);
          } else {
            console.log(`  ⚠️  Деякі елементи можуть бути за межами viewport`);
          }
        } else {
          console.log('  ℹ️  Кнопка інтерактивного завдання не знайдена');
        }
      } else {
        console.log('  ℹ️  Урок не знайдено на головній сторінці');
      }
      
    } catch (error) {
      console.log(`  ❌ Помилка: ${error.message}`);
    }
    
    await context.close();
    await new Promise(resolve => setTimeout(resolve, 2000));
  }
  
  await browser.close();
  
  console.log('\n' + '='.repeat(60));
  console.log('✅ Тест завершено!');
  console.log('='.repeat(60));
  console.log('\n📋 Висновок:');
  console.log('  Якщо всі елементи видимі - адаптивність працює правильно! ✨');
}

quickTest().catch(console.error);
