import 'package:flutter_test_app/_all.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'photos',
              builder: (BuildContext context, GoRouterState state) {
                return const PhotosPage();
              },
            ),
            GoRoute(
              path: 'details',
              builder: (BuildContext context, GoRouterState state) {
                return const PostDetails();
              },
            ),
          ],
        ),
      ],
    );
    return MaterialApp.router(
      restorationScopeId: 'app',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const HomePage(),
      //   "/photos": (context) => const PhotosPage(),
      // },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
    );
  }
}
