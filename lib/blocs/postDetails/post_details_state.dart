import 'package:flutter_test_app/_all.dart';

enum PostDetailsStateStatus { initial, loading, loaded, error }

class PostDetailsState {
  final Posts post;
  final PostDetailsStateStatus status;
  final String errorMessage;

  PostDetailsState({
    required this.post,
    required this.status,
    this.errorMessage = '',
  });

  factory PostDetailsState.initial() {
    return PostDetailsState(
      post: Posts(),
      status: PostDetailsStateStatus.initial,
      errorMessage: '',
    );
  }

  PostDetailsState copyWith({
    Posts? post,
    PostDetailsStateStatus? status,
    String? errorMessage,
  }) {
    return PostDetailsState(
      post: post ?? this.post,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
