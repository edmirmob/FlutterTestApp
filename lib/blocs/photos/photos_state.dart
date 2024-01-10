import 'package:flutter_test_app/_all.dart';

enum PhotosStateStatus {
  initial,
  loading,
  loaded,
  loadingMore,
  loadedMore,
  refreshed,
  error,
}

class PhotosState {
  final List<Photos> photos;
  final PhotosStateStatus status;
  final String errorMessage;
  final int limit;

  PhotosState({
    required this.photos,
    required this.status,
    this.errorMessage = '',
    this.limit = 20,
  });

  factory PhotosState.initial() {
    return PhotosState(
      photos: [],
      status: PhotosStateStatus.initial,
      errorMessage: '',
    );
  }

  PhotosState copyWith({
    List<Photos>? photos,
    PhotosStateStatus? status,
    String? errorMessage,
    int? limit,
  }) {
    return PhotosState(
      photos: photos ?? this.photos,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      limit: limit ?? this.limit,
    );
  }
}
