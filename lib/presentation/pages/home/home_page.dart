import 'package:flutter_test_app/_all.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        title: Text(context.translations.appTitle),
        actions: [
          SizedBox(
            width: 150,
            child: BlocBuilder<UsersBloc, UsersState>(
                builder: (context, userState) {
              return SearchField(
                onSearchChanged: (value) {
                  Users usersId;

                  if (value.isNotEmpty) {
                    usersId = userState.users.firstWhere(
                        (tab) => tab.name!
                            .toLowerCase()
                            .contains(value.toLowerCase()), orElse: () {
                      usersId = Users(id: 0, name: '', username: '', email: '');
                      return usersId;
                    });

                    context
                        .read<PostsBloc>()
                        .add(PostsFiltersLoadEvent(id: usersId.id!));
                  } else {
                    context.read<PostsBloc>().add(PostsLoadEvent());
                  }
                },
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
                label: context.translations.search,
              );
            }),
          ),
        ],
      ),
      body: const PostCommentList(),
    );
  }
}
