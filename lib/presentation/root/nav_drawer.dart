import 'package:flutter_test_app/_all.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.theme.drawerTheme.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const IntroLogo(
                  width: 50,
                ),
                const Gap(10),
                Text(
                  context.translations.appTitle,
                  style: TextStyle(
                      color: context.theme.textTheme.bodyLarge?.color,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Gap(50),
            DrawerItem(
              name: context.translations.homePage,
              onTap: () => context.navigator.pop(),
            ),
            const Gap(5),
            DrawerItem(
                name: context.translations.photosGallery,
                onTap: () {
                  context.navigator.pop();
                  context.go(PhotosPage.routeName);
                })
          ],
        )),
      ),
    );
  }
}
