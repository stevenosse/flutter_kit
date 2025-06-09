clean-ios:
	@echo "Cleaning iOS build files..."
	flutter clean
	rm -rf ios/Pods ios/Podfile.lock 
	flutter pub get 
	cd ios && pod install && cd ..

codegen:
	@echo "Generating code..."
	fvm dart run build_runner build --delete-conflicting-outputs

i18n:
	@echo "Generating i18n..."
	fvm dart run intl_utils:generate

build-android:
	@echo "Building Android..."
	fvm flutter build appbundle --release

build-ios:
	@echo "Building iOS..."
	fvm flutter build ios

get:
	@echo "Getting dependencies..."
	fvm flutter pub get