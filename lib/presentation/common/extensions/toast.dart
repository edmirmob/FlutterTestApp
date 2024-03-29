import 'package:flutter_test_app/_all.dart';

late GlobalKey<NavigatorState> globalNavigatorKey;

abstract class IToast {
  Future success({String? message, Widget? child, bool showIcon = true});
  Future validation({String? message, Widget? child});
  Future error({String? message, Widget? child, bool showIcon = true});
}

class Toast implements IToast {
  @override
  Future success({String? message, Widget? child, bool showIcon = true}) async {
    _showMessage(
      ToastContainer(
        message: message,
        child: child,
        leading: Icons.check_circle_outline,
        color: const Color(0xFF323232),
      ),
    );
  }

  @override
  Future validation({String? message, Widget? child}) async {
    _showMessage(
      ToastContainer(
        message: message,
        child: child,
        color: const Color(0xFF323232),
      ),
    );
  }

  @override
  Future error({String? message, Widget? child, bool showIcon = true}) async {
    _showMessage(
      ToastContainer(
        message: message,
        child: child,
        leading: Icons.cancel_outlined,
        color: const Color(0xFF323232),
      ),
    );
  }

  Future _showMessage(ToastContainer toastContainer) async {
    final context = globalNavigatorKey.currentState?.context;

    if (context != null) {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(toastContainer);
    }
  }
}

class ToastContainer extends SnackBar {
  final String? message;
  final Widget? child;
  final IconData? leading;
  final Color? color;
  final Color? textColor;

  ToastContainer({
    this.message,
    this.child,
    this.leading,
    this.color,
    this.textColor,
  }) : super(
          content: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: color ?? const Color(0xFF323232),
              borderRadius: BorderRadius.circular(8),
            ),
            child: () {
              final content = child ??
                  Text(
                    message.value,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                    ),
                    softWrap: true,
                  );

              return leading != null
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(leading, color: Colors.white),
                        ),
                        const Spacing.horizontalM(),
                        Expanded(child: content),
                      ],
                    )
                  : content;
            }(),
          ),
          padding: const EdgeInsets.all(10),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          elevation: 0,
        );
}
