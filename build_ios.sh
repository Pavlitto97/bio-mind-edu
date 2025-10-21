#!/bin/bash

# BioMindEDU iOS Build Script
# Creates unsigned IPA for sideloading (AltStore, Sideloadly)

set -e

echo "🚀 BioMindEDU iOS Build Script"
echo "================================"
echo ""

# Navigate to project directory
cd "$(dirname "$0")/biomind_edu"

echo "📦 Step 1: Clean previous builds..."
flutter clean
rm -rf build/ios/iphoneos

echo ""
echo "📥 Step 2: Get dependencies..."
flutter pub get

echo ""
echo "🔨 Step 3: Build iOS app (Release, no codesign)..."
flutter build ios --release --no-codesign

echo ""
echo "📱 Step 4: Creating IPA package..."

# Check if .app exists
APP_PATH="build/ios/iphoneos/Runner.app"
if [ ! -d "$APP_PATH" ]; then
    echo "❌ Error: Runner.app not found at $APP_PATH"
    echo "   Try building manually in Xcode:"
    echo "   open ios/Runner.xcworkspace"
    exit 1
fi

# Create Payload directory
mkdir -p build/ios/iphoneos/Payload

# Copy .app to Payload
echo "   Copying Runner.app to Payload..."
cp -r "$APP_PATH" build/ios/iphoneos/Payload/

# Create IPA
IPA_NAME="BioMindEDU_$(date +%Y%m%d_%H%M%S).ipa"
IPA_PATH="build/ios/$IPA_NAME"

echo "   Creating ZIP archive..."
cd build/ios/iphoneos
zip -r "../../$IPA_NAME" Payload -q
cd ../../..

# Cleanup
rm -rf build/ios/iphoneos/Payload

echo ""
echo "✅ IPA created successfully!"
echo ""
echo "📍 Location: biomind_edu/$IPA_PATH"
echo "📊 Size: $(du -h "biomind_edu/$IPA_PATH" | cut -f1)"
echo ""
echo "📲 Installation methods:"
echo "   1. AltStore (https://altstore.io)"
echo "   2. Sideloadly (https://sideloadly.io)"
echo "   3. Apple Configurator 2 (Mac App Store)"
echo ""
echo "⚠️  Note: This is an unsigned IPA"
echo "   - Cannot be installed directly"
echo "   - Requires sideloading tool"
echo "   - Or Apple Developer account for signing"
echo ""
echo "🎉 Done!"
