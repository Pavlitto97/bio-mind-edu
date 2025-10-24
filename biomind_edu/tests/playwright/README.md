# Playwright Tests for BioMindEDU

## iOS Fixes Tests

Tests to verify fixes for iPhone SE 2 issues:

1. **AR Scene Fix**: Verifies that AR scene uses 3D model viewer instead of showing "requires ar_flutter_plugin" error
2. **Interactive Elements Visibility**: Checks that draggable items and drop zones are visible with proper backgrounds
3. **Lesson Title Display**: Confirms lesson title is shown in interactive task AppBar

## Setup

Install dependencies:

```bash
cd tests/playwright
npm install
```

## Running Tests

### Test Production Deployment

Test the live site (https://pavlitto97.github.io/bio-mind-edu/):

```bash
npm test
```

### Test Specific Browser

```bash
# iPhone SE only
npx playwright test --project="iPhone SE"

# Desktop only
npx playwright test --project="Desktop"
```

### Run iOS Fixes Test

```bash
npx playwright test ios_fixes.spec.js --project="iPhone SE"
```

### Generate Test Report

```bash
npx playwright show-report
```

## Test Files

- `ios_fixes.spec.js` - Tests for iPhone SE 2 fixes
- `interactive_task_responsive.spec.js` - General responsive tests
- `playwright.config.ts` - Playwright configuration

## Screenshots

Test screenshots are saved to `tests/screenshots/`:
- `ar-scene-iphone-se.png` - AR scene on iPhone SE
- `interactive-task-iphone-se.png` - Interactive task view
- `lesson-title-{lesson}-iphone-se.png` - Lesson titles for each lesson
- `contrast-check-iphone-se.png` - Element contrast verification

## Configuration

By default, tests run against production URL: `https://pavlitto97.github.io/bio-mind-edu/`

To test a different URL:
```bash
TEST_URL=http://localhost:8080 npm test
```

## Troubleshooting

### Playwright Not Installed

```bash
npx playwright install
```

### Browser Dependencies Missing

```bash
npx playwright install-deps
```

### Tests Failing

1. Check that the app is deployed and accessible
2. Verify network connectivity
3. Check console logs in test output
4. Review screenshots in `tests/screenshots/`

## CI/CD Integration

Tests can be run in GitHub Actions:

```yaml
- name: Install Playwright
  run: |
    cd biomind_edu/tests/playwright
    npm ci
    npx playwright install --with-deps

- name: Run Playwright tests
  run: |
    cd biomind_edu/tests/playwright
    npm test
```
