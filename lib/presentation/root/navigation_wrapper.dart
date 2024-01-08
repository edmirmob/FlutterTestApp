import 'package:flutter_test_app/_all.dart';
import 'package:flutter_test_app/src/sample_feature/sample_item_list_view.dart';

class NavigationWrapper extends StatefulWidget {
  @override
  _NavigationWrapperState createState() => _NavigationWrapperState();
}

class _NavigationWrapperState extends State<NavigationWrapper> {
  @override
  void initState() {
    super.initState();

    // context.read<LocationBloc>().add(LocationCheckEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: () {
        return SampleItemListView();
        // switch (state.index) {
        //   case 0:
        //     return HomePage();
        //   case 1:
        //     return MyTicketsPage();
        //   case 2:
        //     return MyEventsPage();
        //   case 3:
        //     return ProfilePage();
        //   case 4:
        //     return const MorePage();
        // }
      }(),
      // bottomNavigationBar: _BottomNavigationBar(index: state.index),
    );
  }
}

// class _BottomNavigationBar extends StatelessWidget {
//   final int index;

//   const _BottomNavigationBar({
//     Key? key,
//     required this.index,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final padding = 3.0;
//     final selected =
//         context.theme.bottomNavigationBarTheme.selectedIconTheme!.color;
//     final unselected =
//         context.theme.bottomNavigationBarTheme.unselectedIconTheme!.color;

//     return BottomNavigationBar(
//       onTap: (index) {
//         context
//             .read<NavigationBloc>()
//             .add(NavigationChangeIndexEvent(index: index));
//       },
//       currentIndex: index,
//       items: [
//         BottomNavigationBarItem(
//           icon: Padding(
//             padding: EdgeInsets.all(padding),
//             child: Icon(
//               AppIcons.home,
//               color: index == 0 ? selected : unselected,
//             ),
//           ),
//           label: context.translations.home.toLowerCase(),
//         ),
//         BottomNavigationBarItem(
//           icon: Padding(
//             padding: EdgeInsets.all(padding),
//             child: Icon(
//               AppIcons.ticket1,
//               color: index == 1 ? selected : unselected,
//             ),
//           ),
//           label: context.translations.myTickets.toLowerCase(),
//         ),
//         BottomNavigationBarItem(
//           icon: Padding(
//             padding: EdgeInsets.all(padding),
//             child: Icon(
//               AppIcons.flag,
//               color: index == 2 ? selected : unselected,
//             ),
//           ),
//           label: context.translations.myEvents.toLowerCase(),
//         ),
//         BottomNavigationBarItem(
//           icon: Padding(
//             padding: EdgeInsets.all(padding),
//             child: Icon(
//               AppIcons.user,
//               color: index == 3 ? selected : unselected,
//             ),
//           ),
//           label: context.translations.profile.toLowerCase(),
//         ),
//         BottomNavigationBarItem(
//           icon: Padding(
//             padding: EdgeInsets.all(padding),
//             child: Icon(
//               AppIcons.dotsMenuHorizontal,
//               color: index == 4 ? selected : unselected,
//             ),
//           ),
//           label: context.translations.more.toLowerCase(),
//         ),
//       ],
//     );
//   }
// }
