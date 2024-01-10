import 'package:flutter_test_app/_all.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final IPostsRepository postsRepository;

  PostsBloc({
    required this.postsRepository,
  }) : super(initialState()) {
    on<PostsLoadEvent>(_load);
    on<PostsFiltersLoadEvent>(_filtersLoad);
  }

  static PostsState initialState() =>
      PostsState(status: PostsStateStatus.loading, posts: []);

  Future<void> _load(PostsLoadEvent event, Emitter<PostsState> emit) async {
    emit(state.copyWith(status: PostsStateStatus.loading));
    final postsDetails = await postsRepository.getPosts();
    if (postsDetails != null) {
      emit(
          state.copyWith(status: PostsStateStatus.loaded, posts: postsDetails));
    } else {
      emit(state.copyWith(status: PostsStateStatus.error));
    }
  }

  Future<void> _filtersLoad(
      PostsFiltersLoadEvent event, Emitter<PostsState> emit) async {
    emit(state.copyWith(status: PostsStateStatus.loading));

    final filters = await postsRepository.getFiltersPosts(event.id);

    emit(state.copyWith(status: PostsStateStatus.loaded, posts: filters));
  }
}
