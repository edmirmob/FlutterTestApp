import 'package:flutter_test_app/_all.dart';

late EnvironmentType environment = EnvironmentType.production;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RestApiClient.initFlutter();

  final serviceProvider = await resolveServiceProviderFromEnvironment();

  final rootWidget = RepositoryProvider<ServiceProvider>(
    create: (context) => serviceProvider,
    child: NavigationWrapper(),
  );

  if (serviceProvider.appSettings.usingExceptionReporting) {
    Catcher(
      debugConfig: serviceProvider.catcherOptions,
      releaseConfig: serviceProvider.catcherOptions,
      rootWidget: rootWidget,
    );
  } else {
    runZoned(() => runApp(rootWidget));
  }
}
