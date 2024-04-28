clean-ios:
	@echo "Cleaning iOS build files..."
	flutter clean
	rm -rf ios/Pods ios/Podfile.lock 
	flutter pub get 
	cd ios && pod install && cd ..

codegen:
	@echo "Generating code..."
	dart run build_runner build --delete-conflicting-outputs

i18n:
	@echo "Generating i18n..."
	dart pub run intl_utils:generate

build-android:
	@echo "Building Android..."
	flutter build appbundle --release

build-ios:
	@echo "Building iOS..."
	flutter build ios
