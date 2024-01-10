import 'package:flutter_test_app/_all.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final IPostsRepository postsRepository;

  PostDetailsBloc({
    required this.postsRepository,
  }) : super(initialState()) {
    on<PostDetailsLoadByIdEvent>(_loadById);
  }

  static PostDetailsState initialState() =>
      PostDetailsState(status: PostDetailsStateStatus.loading, post: Posts());

  Future<void> _loadById(
      PostDetailsLoadByIdEvent event, Emitter<PostDetailsState> emit) async {
    emit(state.copyWith(status: PostDetailsStateStatus.loading));
    final postsDetails = await postsRepository.getByIdPosts(event.postId ?? 0);
    if (postsDetails != null) {
      emit(state.copyWith(
          status: PostDetailsStateStatus.loaded, post: postsDetails));
    } else {
      emit(state.copyWith(status: PostDetailsStateStatus.error));
    }
  }
}
