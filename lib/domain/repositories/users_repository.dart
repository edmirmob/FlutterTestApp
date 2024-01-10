import 'package:flutter_test_app/_all.dart';

abstract class IUsersRepository {
  Future<List<Users>?> getUsers();
}

class UsersRepository implements IUsersRepository {
  final RestApiClient restApiClient;

  UsersRepository({
    required this.restApiClient,
  });
  @override
  Future<List<Users>?> getUsers() async {
    try {
      final response = await restApiClient.get(
        '/users',
      );

      final result = response.data as List<dynamic>;
      return result.map<Users>((json) => Users.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
