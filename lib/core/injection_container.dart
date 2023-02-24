import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:talker_flutter/talker_flutter.dart';

import 'injection_container.config.dart';

/// Instance of the service locator to use
/// whenever a dependency is required to be retrieved
final getIt = GetIt.instance;

/// Autogenerate a method with project dependency injection
@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => init(getIt);


/// Third party module dependency injection
@module
abstract class InjectableThirdPartiesModule {
  @singleton
  http.Client get client => http.Client();

  @singleton
  Talker get talker => Talker();
}
