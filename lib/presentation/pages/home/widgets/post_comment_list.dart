import 'package:flutter_test_app/_all.dart';

class PostCommentList extends StatelessWidget {
  const PostCommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, commentsState) {
        return BlocBuilder<PostsBloc, PostsState>(
          builder: (context, postsState) {
            return BlocBuilder<UsersBloc, UsersState>(
              builder: (context, usersState) {
                return BlocBuilder<PhotosBloc, PhotosState>(
                  builder: (context, photosState) {
                    return ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          final posts = postsState.posts[index];
                          final users = usersState.users.firstWhere(
                            (user) => posts.userId == user.id,
                          );
                          List<Comments> comments = [];
                          for (var element in commentsState.comments) {
                            if (element.postId == posts.id) {
                              comments.add(element);
                            }
                          }
                          final authorName = users.name ?? '';

                          return ExpansionTile(
                            controlAffinity: ListTileControlAffinity.trailing,
                            leading: Text(
                              postsState.posts[index].id.toString(),
                            ),
                            title: InkWell(
                              onTap: () {
                                context.read<PostDetailsBloc>().add(
                                    PostDetailsLoadByIdEvent(
                                        postId: postsState.posts[index].id!));
                                context.go(PostDetails.routeName);
                              },
                              child: Text(
                                postsState.posts[index].title!.toUpperCase(),
                                maxLines: 2,
                              ),
                            ),
                            subtitle: InkWell(
                                onTap: () {
                                  context.read<PostDetailsBloc>().add(
                                      PostDetailsLoadByIdEvent(
                                          postId: postsState.posts[index].id!));
                                  context.go(PostDetails.routeName);
                                },
                                child: Text(authorName.toString())),
                            children: <Widget>[
                              SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    itemCount: comments.isNotEmpty
                                        ? comments.length
                                        : 0,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ListTile(
                                              title: Text(comments[index]
                                                  .body
                                                  .toString())),
                                        ],
                                      );
                                    }),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1, color: Colors.green),
                        itemCount: postsState.posts.length);
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
