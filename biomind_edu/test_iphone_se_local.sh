#!/bin/bash

# Quick iPhone SE Emulation Test
# Tests the responsive layout locally

echo "🧪 Testing BioMindEDU on iPhone SE emulation..."
echo ""

# Check if server is running
if ! lsof -ti:8080 > /dev/null 2>&1; then
    echo "❌ Server not running on port 8080"
    echo "Please run: cd biomind_edu/build/web && python3 -m http.server 8080"
    exit 1
fi

echo "✅ Server detected on http://localhost:8080"
echo ""

# Open in browser with iPhone SE viewport
echo "📱 Opening in browser with iPhone SE viewport (375x667)..."
echo ""
echo "Please check in Developer Tools:"
echo "  1. Open DevTools (F12 or Cmd+Option+I)"
echo "  2. Toggle Device Toolbar (Cmd+Shift+M)"
echo "  3. Select 'iPhone SE' from device dropdown"
echo "  4. Navigate to first lesson (Cell)"
echo "  5. Check interactive task elements are visible"
echo ""
echo "Expected to see:"
echo "  ✅ AppBar shows 'Cell Structure' (not 'Lesson TITLE')"
echo "  ✅ Draggable items visible with colored backgrounds"
echo "  ✅ Drop zones visible with borders"
echo "  ✅ All elements within viewport"
echo ""

# Open browser
if [[ "$OSTYPE" == "darwin"* ]]; then
    open "http://localhost:8080"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    xdg-open "http://localhost:8080"
else
    echo "Please open http://localhost:8080 in your browser"
fi

echo ""
echo "Press Ctrl+C when done testing to stop the script"
sleep infinity
