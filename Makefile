test:
	flutter test --coverage --no-sound-null-safety

gen-files:
	flutter pub run build_runner build --delete-conflicting-outputs

autogf:
	@bash -c 'echo ;\
	echo EJ. flutter pub run build_runner build --build-filter "lib/auth/core/domain/**.dart"; \
	read -p "[Path to file] (Just the Path, NO file name EJ. lib/core/**.dart): " path; \
	echo flutter pub run build_runner build --build-filter "$$path"; \
	flutter pub run build_runner build --build-filter "$$path"; \
	echo ;\
	'

deps:
	flutter pub get

init:
	flutter pub get
	flutter pub run build_runner build --delete-conflicting-outputs

watch:
	flutter pub get
	flutter pub run build_runner watch --delete-conflicting-outputs



gnb:
# Git user name needs to be changed by desired
	@bash -c '\
  username=$(shell git config user.name); \
  echo ;\
  read -p "Write type branch[Ex. fix, feat]: " typeBranch; \
  read -p "[Branch purpose] (without spaces: EX. make-something-cool): " purpose; \
  echo git checkout -b $$typeBranch-$$username-app-$$purpose; \
	git checkout -b $$typeBranch-$$username-flutter-leal-app-$$purpose; \
  '

cleanAndroid:
	rm -rf android/app/build
	flutter pub cache repair
	flutter clean

cleanIOS:
	@bash -c 'echo ;\
	echo rm -rf ios/Pods/; \
	rm -rf ios/Pods/; \
	echo rm -rf ios/Podfile.lock; \
	rm -rf ios/Podfile.lock; \
	echo flutter pub get; \
	flutter pub get; \
	echo cd ios/; \
	cd ios/; \
	echo pod install; \
	pod install; \
	echo cd ..; \
	cd ..; \
	'
autoTest:
	@bash -c 'echo ;\
	echo EJ. flutter test --coverage "test/auth/core/infrastructure/remote_services"; \
	read -p "[Path to folder] (Just the Path EJ. lib/core/): " path; \
	echo flutter test --coverage  "$$path"; \
	echo ;\
	 flutter test --coverage  "$$path"; \
	'
