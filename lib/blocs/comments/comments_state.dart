import 'package:flutter_test_app/_all.dart';

enum CommentsStateStatus { initial, loading, loaded, error }

class CommentsState {
  final List<Comments> comments;
  final CommentsStateStatus status;
  final String errorMessage;

  CommentsState({
    required this.comments,
    required this.status,
    this.errorMessage = '',
  });

  factory CommentsState.initial() {
    return CommentsState(
      comments: [],
      status: CommentsStateStatus.initial,
      errorMessage: '',
    );
  }

  CommentsState copyWith({
    List<Comments>? comments,
    CommentsStateStatus? status,
    String? errorMessage,
  }) {
    return CommentsState(
      comments: comments ?? this.comments,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
