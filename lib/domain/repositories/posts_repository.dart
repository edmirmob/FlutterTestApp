import 'package:flutter_test_app/_all.dart';

abstract class IPostsRepository {
  Future<List<Posts>?> getPosts();
  Future<Posts?> getByIdPosts(int id);
  Future<List<Posts>?> getFiltersPosts(int? id);
}

class PostsRepository implements IPostsRepository {
  final RestApiClient restApiClient;

  PostsRepository({
    required this.restApiClient,
  });
  @override
  Future<List<Posts>?> getPosts() async {
    try {
      final response = await restApiClient.get(
        '/posts',
      );

      final result = response.data as List<dynamic>;
      return result.map<Posts>((json) => Posts.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Posts?> getByIdPosts(int id) async {
    try {
      final response = await restApiClient.get('/posts/$id');

      final event = Posts.fromMap(response.data);

      return event;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Posts>?> getFiltersPosts(int? id) async {
    try {
      final response = await restApiClient.get(
        '/users/$id/posts',
      );
      final result = response.data as List<dynamic>;
      return result.map<Posts>((json) => Posts.fromMap(json)).toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
