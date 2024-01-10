import 'package:flutter_test_app/_all.dart';

abstract class ICommentsRepository {
  Future<List<Comments>?> getComments();
}

class CommentsRepository implements ICommentsRepository {
  final RestApiClient restApiClient;

  CommentsRepository({
    required this.restApiClient,
  });
  @override
  Future<List<Comments>?> getComments() async {
    try {
      final response = await restApiClient.get(
        '/comments',
      );

      final result = response.data as List<dynamic>;
      return result.map<Comments>((json) => Comments.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
