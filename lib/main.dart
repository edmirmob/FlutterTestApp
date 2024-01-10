import 'package:flutter_test_app/_all.dart';
import 'package:flutter_test_app/app.dart';

late EnvironmentType environment = EnvironmentType.development;
// Future<void> main() async {
//   await RestApiClient.initFlutter();

//   final serviceProvider = await resolveServiceProviderFromEnvironment();

//   final rootWidget = RepositoryProvider<ServiceProvider>(
//     create: (context) => serviceProvider,
//     child: const App(),
//   );

//   if (serviceProvider.appSettings.usingExceptionReporting) {
//     Catcher(
//       debugConfig: serviceProvider.catcherOptions,
//       releaseConfig: serviceProvider.catcherOptions,
//       rootWidget: rootWidget,
//     );
//   } else {
//     Bloc.observer = AppBlocObserver();
//     runZonedGuarded(
//       () => runApp(rootWidget),
//       (error, stack) {
//         print('Uncaught error: $error');
//         print('Stack trace: $stack');
//       },
//     );
//   }
// }
Future<void> main() async {
  await RestApiClient.initFlutter();

  final serviceProvider = await resolveServiceProviderFromEnvironment();

  final rootWidget = RepositoryProvider<ServiceProvider>(
    create: (context) => serviceProvider,
    child: const ContextServiceProviderBlocs(
      child: App(),
    ),
  );

  if (serviceProvider.appSettings.usingExceptionReporting) {
    Catcher(
      debugConfig: serviceProvider.catcherOptions,
      releaseConfig: serviceProvider.catcherOptions,
      rootWidget: rootWidget,
    );
  } else {
    Bloc.observer = AppBlocObserver();
    runZonedGuarded(
      () => runApp(rootWidget),
      (error, stack) {
        print('Uncaught error: $error');
        print('Stack trace: $stack');
      },
    );
  }
}
