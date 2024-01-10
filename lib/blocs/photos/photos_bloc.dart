import 'package:flutter_test_app/_all.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  final IPhotosRepository photosRepository;

  PhotosBloc({
    required this.photosRepository,
  }) : super(initialState()) {
    on<PhotosLoadEvent>(_load);
    on<PhotosLoadMoreEvent>(_loadMore);
    on<PhotosRefreshEvent>(_refresh);
    on<PhotosGetRangeEvent>(_range);
  }

  static PhotosState initialState() =>
      PhotosState(status: PhotosStateStatus.loading, photos: []);

  Future<void> _load(PhotosLoadEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(status: PhotosStateStatus.loading));
    final photosDetails = await photosRepository.getPhotos(Photos());
    if (photosDetails != null) {
      emit(state.copyWith(
          status: PhotosStateStatus.loaded, photos: photosDetails, limit: 20));
    } else {
      emit(state.copyWith(status: PhotosStateStatus.error));
    }
  }

  Future<void> _loadMore(
      PhotosLoadMoreEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(status: PhotosStateStatus.loading));

    Photos photo = Photos(limit: state.limit);
    photo.increment();
    final items = await photosRepository.getPhotos(photo);

    if (items?.isNotEmpty ?? true) {
      if (items != null) {
        state.photos.addAll(items);
        emit(state.copyWith(status: PhotosStateStatus.loadedMore));
      } else {
        emit(state.copyWith(status: PhotosStateStatus.error));
      }
    }
  }

  Future<void> _refresh(
      PhotosRefreshEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(status: PhotosStateStatus.loadingMore));
    Photos photo = Photos();
    photo.reset();

    final photosDetails = await photosRepository.getPhotos(photo);
    if (photosDetails != null) {
      emit(state.copyWith(
          status: PhotosStateStatus.refreshed, photos: photosDetails));
    } else {
      emit(state.copyWith(status: PhotosStateStatus.error));
    }
  }

  Future<void> _range(
      PhotosGetRangeEvent event, Emitter<PhotosState> emit) async {
    emit(state.copyWith(status: PhotosStateStatus.loading));

    final items =
        await photosRepository.getRange(event.page ?? 0, event.limit ?? 0);

    if (items?.isNotEmpty ?? true) {
      if (items != null) {
        emit(state.copyWith(
            status: PhotosStateStatus.loaded,
            photos: items,
            limit: event.limit));
      } else {
        emit(state.copyWith(status: PhotosStateStatus.error));
      }
    }
  }
}
