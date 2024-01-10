import 'package:flutter_test_app/_all.dart';

class IntroLogo extends StatelessWidget {
  const IntroLogo({
    Key? key,
    this.color,
    this.width,
  }) : super(key: key);

  final Color? color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 100,
      height: 50,
      child: Image.asset(
        'assets/images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
