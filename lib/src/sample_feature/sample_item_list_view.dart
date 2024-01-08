import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/_all.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Container(
        // child: BlocProvider(
        //   create: (context) => CommentsBloc(
        //     eventsRepository: context.serviceProvider.eventsRepository,
        //   )..add(FetchComments()),
        child: BlocBuilder<CommentsBloc, CommentsState>(
          builder: (context, guestsState) {
            if (guestsState.comments[0].body.isNotNullOrEmpty) {
              return Text(context.translations.appTitle);
            } else {
              return Text('data');
            }
          },
        ),
      ),
    );
  }
} 
          // builder: (context, myActiveEventsState) {
          //   if (myActiveEventsState.status == CommentsStateStatus.loaded && myActiveEventsState.comments.isNotEmpty) {
          //     return Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //       child:  Text(
          //             'context.translations.myActiveEvents',
          //             style: const TextStyle(
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18,
          //             ),
          //           ),   
                        
          // );
 
        
     
        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        // body: ListView.builder(
        //   // Providing a restorationId allows the ListView to restore the
        //   // scroll position when a user leaves and returns to the app after it
        //   // has been killed while running in the background.
        //   restorationId: 'sampleItemListView',
        //   itemCount: items.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     final item = items[index];
      
        //     return ListTile(
        //         title: Text('SampleItem ${item.id}'),
        //         leading: const CircleAvatar(
        //           // Display the Flutter Logo image asset.
        //           foregroundImage: AssetImage('assets/images/flutter_logo.png'),
        //         ),
        //         onTap: () {
        //           // Navigate to the details page. If the user leaves and returns to
        //           // the app after it has been killed while running in the
        //           // background, the navigation stack is restored.
        //           Navigator.restorablePushNamed(
        //             context,
        //             SampleItemDetailsView.routeName,
        //           );
        //         });
        //   },
        // ),
       

