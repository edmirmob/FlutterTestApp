import 'package:flutter_test_app/_all.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  ScaffoldState get scaffold => Scaffold.of(this);

  NavigatorState get navigator => Navigator.of(this);
  void popTimes([int number = 1]) => navigator.popTimes(number);
  void pop<T>([T? result]) => navigator.pop();
  void popUntilLast<T>([T? result]) {
    while (navigator.canPop()) {
      navigator.pop();
    }
  }

  Future pushReplacementPage(Widget page) {
    return navigator.pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  IToast get toast => serviceProvider.toast;

  Future popUntilLastAndPushPage(Widget page) {
    popUntilLast();
    return pushPage(page);
  }

  void popUntilEnd<T>([T? result]) => navigator.popUntilEnd();
  Future pushPage(Widget page) {
    unfocus();

    return navigator.push(MaterialPageRoute(builder: (_) => page));
  }

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;

  ServiceProvider get serviceProvider =>
      RepositoryProvider.of<ServiceProvider>(this);
  AppSettings get appSettings => serviceProvider.appSettings;
  T validator<T>() => RepositoryProvider.of<T>(this);

  void unfocus() => FocusScope.of(this).unfocus();
}
