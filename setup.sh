#!/bin/bash

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Flutter Kit Installation Script${NC}"
echo "----------------------------------------"

# Function to read value from pubspec.yaml
read_pubspec_value() {
    local key=$1
    value=$(grep "^  $key:" pubspec.yaml | cut -d ':' -f 2- | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed 's/^"\(.*\)"$/\1/')
    echo "$value"
}

# Read values from pubspec.yaml
APP_NAME=$(read_pubspec_value "app_name")
IOS_BUNDLE_ID=$(read_pubspec_value "ios_bundle_id")
ANDROID_PACKAGE_NAME=$(read_pubspec_value "android_package_name")
DART_PACKAGE=$(read_pubspec_value "dart_package")

echo -e "${GREEN}Configuration from pubspec.yaml:${NC}"
echo "App Name: $APP_NAME"
echo "iOS Bundle ID: $IOS_BUNDLE_ID"
echo "Android Package Name: $ANDROID_PACKAGE_NAME"
echo "Dart Package Name: $DART_PACKAGE"
echo ""

# Check if running on macOS for iOS updates
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Update iOS bundle identifier
    echo -e "${BLUE}Updating iOS bundle identifier...${NC}"
    find ios -name "project.pbxproj" -exec sed -i '' "s/PRODUCT_BUNDLE_IDENTIFIER = .*;/PRODUCT_BUNDLE_IDENTIFIER = $IOS_BUNDLE_ID;/g" {} \;

    # Update iOS app name
    echo -e "${BLUE}Updating iOS app name...${NC}"
    PLIST_PATH="ios/Runner/Info.plist"
    plutil -replace CFBundleName -string "$APP_NAME" "$PLIST_PATH"
    plutil -replace CFBundleDisplayName -string "$APP_NAME" "$PLIST_PATH"
fi

# Android package updates
echo -e "${BLUE}Updating Android configuration...${NC}"
BUILD_GRADLE_PATH="android/app/build.gradle.kts"

# Extract current applicationId and namespace
OLD_APPLICATION_ID=$(grep "applicationId" "$BUILD_GRADLE_PATH" | head -1 | sed "s/.*applicationId = \"\(.*\)\".*/\1/")
OLD_NAMESPACE=$(grep "namespace" "$BUILD_GRADLE_PATH" | head -1 | sed "s/.*namespace = \"\(.*\)\".*/\1/")

echo "Current applicationId: $OLD_APPLICATION_ID"
echo "Current namespace: $OLD_NAMESPACE"
echo "New package name: $ANDROID_PACKAGE_NAME"

# Update build.gradle.kts
echo -e "${BLUE}Updating build.gradle.kts...${NC}"
sed -i.bak "s/applicationId = \"$OLD_APPLICATION_ID\"/applicationId = \"$ANDROID_PACKAGE_NAME\"/g" "$BUILD_GRADLE_PATH"
sed -i.bak "s/namespace = \"$OLD_NAMESPACE\"/namespace = \"$ANDROID_PACKAGE_NAME\"/g" "$BUILD_GRADLE_PATH"
rm "$BUILD_GRADLE_PATH.bak"

# Update AndroidManifest.xml
echo -e "${BLUE}Updating AndroidManifest.xml...${NC}"
find android -name "AndroidManifest.xml" -exec sed -i.bak "s/package=\"$OLD_NAMESPACE\"/package=\"$ANDROID_PACKAGE_NAME\"/g" {} \;
find android -name "AndroidManifest.xml" -exec sed -i.bak "s/android:label=\"[^\"]*\"/android:label=\"$APP_NAME\"/g" {} \;
find android -name "*.bak" -type f -delete

# Move Java/Kotlin files to new package structure
echo -e "${BLUE}Reorganizing source files...${NC}"
OLD_PATH=$(echo "$OLD_NAMESPACE" | sed 's/\./\//g')
NEW_PATH=$(echo "$ANDROID_PACKAGE_NAME" | sed 's/\./\//g')
KOTLIN_PATH="android/app/src/main/kotlin"

# Create new directory structure
mkdir -p "$KOTLIN_PATH/$NEW_PATH"

# Handle MainActivity.kt
if [ -f "$KOTLIN_PATH/$OLD_PATH/MainActivity.kt" ]; then
    echo -e "${BLUE}Updating MainActivity.kt...${NC}"
    sed "s/package $OLD_NAMESPACE/package $ANDROID_PACKAGE_NAME/g" "$KOTLIN_PATH/$OLD_PATH/MainActivity.kt" > "$KOTLIN_PATH/$NEW_PATH/MainActivity.kt"
    rm -f "$KOTLIN_PATH/$OLD_PATH/MainActivity.kt"
else
    echo -e "${BLUE}Creating new MainActivity.kt...${NC}"
    cat > "$KOTLIN_PATH/$NEW_PATH/MainActivity.kt" << EOL
package $ANDROID_PACKAGE_NAME

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
EOL
fi

# Cleanup old package structure
echo -e "${BLUE}Cleaning up old files...${NC}"
if [ -d "$KOTLIN_PATH/$OLD_PATH" ]; then
    find "$KOTLIN_PATH/$OLD_PATH" -type f -delete
    find "$KOTLIN_PATH" -type d -empty -delete
fi

# Update Dart package name in files
echo -e "${BLUE}Updating Dart package name in files...${NC}"
find lib -type f -name "*.dart" -exec sed -i.bak "s/package:flutter_kit\//package:$DART_PACKAGE\//g" {} \;
find lib -name "*.bak" -type f -delete

# Update package name in pubspec.yaml
echo -e "${BLUE}Updating package name in pubspec.yaml...${NC}"
sed -i.bak "s/^name: .*/name: $DART_PACKAGE/" pubspec.yaml
rm -f pubspec.yaml.bak

echo -e "${GREEN}Android configuration updated successfully!${NC}"
echo "Please rebuild your project:"
echo "flutter clean && flutter pub get"