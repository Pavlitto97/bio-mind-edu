#!/bin/bash

# iOS Fixes Test Script
# Quick test runner for iPhone SE fixes

set -e

echo "🧪 BioMindEDU - iOS Fixes Test Runner"
echo "======================================"
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "pubspec.yaml" ]; then
    echo -e "${RED}Error: Please run this script from biomind_edu directory${NC}"
    exit 1
fi

# Step 1: Build the app
echo -e "${BLUE}Step 1: Building Flutter web app...${NC}"
flutter clean
flutter pub get
flutter build web --release

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Build successful${NC}"
else
    echo -e "${RED}❌ Build failed${NC}"
    exit 1
fi

echo ""

# Step 2: Check if Playwright is installed
echo -e "${BLUE}Step 2: Checking Playwright installation...${NC}"
cd tests/playwright

if [ ! -d "node_modules" ]; then
    echo "Installing Playwright dependencies..."
    npm install
fi

echo -e "${GREEN}✅ Playwright ready${NC}"
echo ""

# Step 3: Run tests
echo -e "${BLUE}Step 3: Running iOS fixes tests...${NC}"
echo ""

# Ask user which tests to run
echo "Select test mode:"
echo "1) Test production site (https://pavlitto97.github.io/bio-mind-edu/)"
echo "2) Test local build (requires local server on port 8080)"
echo "3) Run with UI mode (headed browser)"
echo ""
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        echo -e "${BLUE}Testing production site...${NC}"
        npx playwright test ios_fixes.spec.js --project="iPhone SE"
        ;;
    2)
        echo -e "${BLUE}Testing local build...${NC}"
        # Start local server in background
        cd ../../build/web
        python3 -m http.server 8080 &
        SERVER_PID=$!
        cd ../../tests/playwright
        
        sleep 2
        TEST_URL=http://localhost:8080 npx playwright test ios_fixes.spec.js --project="iPhone SE"
        
        # Stop server
        kill $SERVER_PID 2>/dev/null || true
        ;;
    3)
        echo -e "${BLUE}Running with UI mode...${NC}"
        npx playwright test ios_fixes.spec.js --project="iPhone SE" --headed
        ;;
    *)
        echo -e "${RED}Invalid choice${NC}"
        exit 1
        ;;
esac

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ All tests passed!${NC}"
    echo ""
    echo "📸 Screenshots saved to: tests/screenshots/"
    echo "📊 View report: npx playwright show-report"
    echo ""
    echo -e "${GREEN}🎉 iOS fixes verified successfully!${NC}"
else
    echo ""
    echo -e "${RED}❌ Some tests failed${NC}"
    echo "Check the output above for details"
    exit 1
fi
