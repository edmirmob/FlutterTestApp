import 'package:flutter_test_app/domain/models/_all.dart';
import 'package:quiver/core.dart';

class Photos extends Pagination {
  final int? albumId;
  final int? id;
  final String? title;
  final String? url;
  final String? thumbnailUrl;

  Photos({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
    int? page = 1,
    int? limit = 20,
  }) : super(
          skip: page,
          take: limit,
        );
  Photos copyWith({
    Optional<int>? page,
    Optional<int>? limit,
  }) {
    return Photos(
      page: page != null ? page.value : this.page,
      limit: limit != null ? limit.value : this.take,
    );
  }

  factory Photos.fromMap(Map<dynamic, dynamic> map) {
    return Photos(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}
