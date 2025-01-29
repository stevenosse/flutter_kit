@echo off
setlocal EnableDelayedExpansion

echo Flutter Kit Installation Script
echo ----------------------------------------

:: Function to read value from pubspec.yaml using findstr and remove quotes
for /f "tokens=2 delims=:" %%a in ('findstr /r "^  app_name:" pubspec.yaml') do (
    set "APP_NAME=%%a"
    set "APP_NAME=!APP_NAME: =!"
    set "APP_NAME=!APP_NAME:"=!"
)
for /f "tokens=2 delims=:" %%a in ('findstr /r "^  ios_bundle_id:" pubspec.yaml') do (
    set "IOS_BUNDLE_ID=%%a"
    set "IOS_BUNDLE_ID=!IOS_BUNDLE_ID: =!"
)
for /f "tokens=2 delims=:" %%a in ('findstr /r "^  android_package_name:" pubspec.yaml') do (
    set "ANDROID_PACKAGE_NAME=%%a"
    set "ANDROID_PACKAGE_NAME=!ANDROID_PACKAGE_NAME: =!"
)

echo Configuration from pubspec.yaml:
echo App Name: !APP_NAME!
echo iOS Bundle ID: !IOS_BUNDLE_ID!
echo Android Package Name: !ANDROID_PACKAGE_NAME!
echo.

:: Get current applicationId and namespace from build.gradle
set "BUILD_GRADLE_PATH=android\app\build.gradle"
for /f "tokens=2 delims=:" %%a in ('findstr /r "applicationId" "%BUILD_GRADLE_PATH%"') do (
    set "OLD_APPLICATION_ID=%%a"
    set "OLD_APPLICATION_ID=!OLD_APPLICATION_ID: =!"
    set "OLD_APPLICATION_ID=!OLD_APPLICATION_ID:"=!"
)
for /f "tokens=2 delims=:" %%a in ('findstr /r "namespace" "%BUILD_GRADLE_PATH%"') do (
    set "OLD_NAMESPACE=%%a"
    set "OLD_NAMESPACE=!OLD_NAMESPACE: =!"
    set "OLD_NAMESPACE=!OLD_NAMESPACE:"=!"
)

echo Current applicationId: !OLD_APPLICATION_ID!
echo Current namespace: !OLD_NAMESPACE!
echo New package name: !ANDROID_PACKAGE_NAME!

:: Update build.gradle
echo Updating build.gradle...
powershell -Command "(Get-Content '%BUILD_GRADLE_PATH%') -replace 'applicationId \"!OLD_APPLICATION_ID!\"', 'applicationId \"!ANDROID_PACKAGE_NAME!\"' | Set-Content '%BUILD_GRADLE_PATH%'"
powershell -Command "(Get-Content '%BUILD_GRADLE_PATH%') -replace 'namespace \"!OLD_NAMESPACE!\"', 'namespace \"!ANDROID_PACKAGE_NAME!\"' | Set-Content '%BUILD_GRADLE_PATH%'"

:: Update AndroidManifest.xml
echo Updating AndroidManifest.xml...
for /r "android" %%F in (AndroidManifest.xml) do (
    powershell -Command "(Get-Content '%%F') -replace 'package=\"!OLD_NAMESPACE!\"', 'package=\"!ANDROID_PACKAGE_NAME!\"' -replace 'android:label=\"[^\"]*\"', 'android:label=\"!APP_NAME!\"' | Set-Content '%%F'"
)

:: Move Java/Kotlin files to new package structure
echo Moving Android files to new package structure...
set "OLD_PATH=!OLD_NAMESPACE:.=\!"
set "NEW_PATH=!ANDROID_PACKAGE_NAME:.=\!"
set "KOTLIN_PATH=android\app\src\main\kotlin"

:: Create new package directory
if not exist "!KOTLIN_PATH!\!NEW_PATH!" mkdir "!KOTLIN_PATH!\!NEW_PATH!"

:: Handle MainActivity.kt
if exist "!KOTLIN_PATH!\!OLD_PATH!\MainActivity.kt" (
    echo Copying and updating existing MainActivity.kt...
    powershell -Command "(Get-Content '!KOTLIN_PATH!\!OLD_PATH!\MainActivity.kt') -replace 'package !OLD_NAMESPACE!', 'package !ANDROID_PACKAGE_NAME!' | Set-Content '!KOTLIN_PATH!\!NEW_PATH!\MainActivity.kt'"
    :: Delete old MainActivity.kt
    del "!KOTLIN_PATH!\!OLD_PATH!\MainActivity.kt"
) else (
    echo Creating new MainActivity.kt...
    (
        echo package !ANDROID_PACKAGE_NAME!
        echo.
        echo import io.flutter.embedding.android.FlutterActivity
        echo.
        echo class MainActivity: FlutterActivity {
        echo }
    ) > "!KOTLIN_PATH!\!NEW_PATH!\MainActivity.kt"
)

:: Clean up old package structure
if exist "!KOTLIN_PATH!\!OLD_PATH!" (
    echo Cleaning up old package directory...
    :: Move any remaining files
    for %%F in ("!KOTLIN_PATH!\!OLD_PATH!\*") do (
        if not "%%~nxF"=="MainActivity.kt" (
            move "%%F" "!KOTLIN_PATH!\!NEW_PATH!" > nul
        )
    )
    :: Remove old directory
    rmdir /S /Q "!KOTLIN_PATH!\!OLD_PATH!"
)

echo Installation completed successfully!
echo Please rebuild your project:
echo flutter clean ^&^& flutter pub get

endlocal