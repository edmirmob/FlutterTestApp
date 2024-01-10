import 'package:flutter_test_app/_all.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key? key,
    this.icon,
    this.name,
    this.onTap,
  }) : super(key: key);

  final String? icon;
  final String? name;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      onTap: onTap ?? () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                const Gap(15),
                Text(
                  name ?? context.translations.enterName,
                  style: TextStyle(
                    color: context.theme.textTheme.bodySmall?.color,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: context.theme.iconTheme.color,
                ),
              ],
            ),
          ),
          Opacity(
            opacity: 0.25,
            child: Divider(
              color: context.theme.dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
