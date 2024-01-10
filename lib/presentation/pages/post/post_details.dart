import 'package:flutter_test_app/_all.dart';
import 'package:shimmer/shimmer.dart';

class PostDetails extends StatelessWidget {
  static const routeName = '/details';
  const PostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.postDetails),
      ),
      body: BlocBuilder<PostDetailsBloc, PostDetailsState>(
        builder: (context, postsState) {
          if (postsState.status == PostDetailsStateStatus.loading) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(
                color: Colors.white,
              ),
            );
          }
          return Container(
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                const Gap(10),
                Center(
                  child: Text(
                    postsState.post.title!.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                const Gap(30),
                Text(
                  postsState.post.body.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
