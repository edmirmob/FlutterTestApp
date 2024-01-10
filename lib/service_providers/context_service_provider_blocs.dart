import 'package:flutter_test_app/_all.dart';

class ContextServiceProviderBlocs extends StatelessWidget {
  final Widget child;

  const ContextServiceProviderBlocs({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommentsBloc>(
          create: (BuildContext context) => CommentsBloc(
            commentsRepository: context.serviceProvider.commentsRepository,
          )..add(CommentsLoadEvent()),
        ),
        BlocProvider<PostsBloc>(
          lazy: false,
          create: (BuildContext context) => PostsBloc(
            postsRepository: context.serviceProvider.postsRepository,
          )..add(PostsLoadEvent()),
        ),
        BlocProvider<PhotosBloc>(
          create: (BuildContext context) => PhotosBloc(
            photosRepository: context.serviceProvider.photosRepository,
          )..add(PhotosLoadEvent()),
        ),
        BlocProvider<PostDetailsBloc>(
          lazy: false,
          create: (BuildContext context) => PostDetailsBloc(
            postsRepository: context.serviceProvider.postsRepository,
          )..add(PostDetailsLoadByIdEvent()),
        ),
        BlocProvider<UsersBloc>(
          lazy: false,
          create: (BuildContext context) => UsersBloc(
            usersRepository: context.serviceProvider.usersRepository,
          )..add(UsersLoadEvent()),
        ),
      ],
      child: child,
    );
  }
}
