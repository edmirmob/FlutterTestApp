import 'package:flutter_test_app/_all.dart';

abstract class IPhotosRepository {
  Future<List<Photos>?> getPhotos(Photos photos);
  Future<List<Photos>?> getRange(int page, int limit);
}

class PhotosRepository implements IPhotosRepository {
  final RestApiClient restApiClient;

  PhotosRepository({
    required this.restApiClient,
  });
  @override
  Future<List<Photos>?> getPhotos(Photos photo) async {
    var _page = photo.page;
    var _limit = photo.take;
    try {
      final response = await restApiClient.get(
        '/photos',
        queryParameters: {
          '_page': _page.toString(),
          '_limit': _limit.toString(),
        },
      );

      final result = response.data as List<dynamic>;
      return result.map<Photos>((json) => Photos.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Photos>?> getRange(int page, int limit) async {
    var _page = page;
    var _limit = limit;
    try {
      final response = await restApiClient.get(
        '/photos',
        queryParameters: {
          '_page': _page.toString(),
          '_limit': _limit.toString(),
        },
      );

      final result = response.data as List<dynamic>;
      return result.map<Photos>((json) => Photos.fromMap(json)).toList();
    } catch (e) {
      return [];
    }
  }
}
