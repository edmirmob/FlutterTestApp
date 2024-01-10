import 'package:flutter_test_app/_all.dart';
import 'package:flutter_test_app/main.dart' as app;

Future main() async {
  app.environment = EnvironmentType.development;
  await app.main();
}
