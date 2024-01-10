import 'package:flutter_test_app/_all.dart';

enum PostsStateStatus { initial, loading, loaded, error }

class PostsState {
  final List<Posts> posts;
  final PostsStateStatus status;
  final String errorMessage;

  PostsState({
    required this.posts,
    required this.status,
    this.errorMessage = '',
  });

  factory PostsState.initial() {
    return PostsState(
      posts: [],
      status: PostsStateStatus.initial,
      errorMessage: '',
    );
  }

  PostsState copyWith({
    List<Posts>? posts,
    PostsStateStatus? status,
    String? errorMessage,
  }) {
    return PostsState(
      posts: posts ?? this.posts,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
