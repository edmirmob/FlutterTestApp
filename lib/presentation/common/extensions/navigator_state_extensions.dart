import 'package:flutter_test_app/_all.dart';

extension NavigatorStateExtensions on NavigatorState {
  void popTimes([int number = 1]) {
    for (var i = 0; i < number; i++) {
      pop();
    }
  }

  void pushPage(Widget page) => push(MaterialPageRoute(builder: (_) => page));

  void popUntilEnd() {
    while (canPop()) {
      pop();
    }
  }
}
