codegen:
	fvm dart run build_runner build --delete-conflicting-outputs

clean-ios:
	fvm flutter clean
	rm -rf ios/Pods ios/Podfile.lock 
	fvm flutter pub get 
	cd ios && pod install && cd ..