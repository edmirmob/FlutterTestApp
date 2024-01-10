import 'package:flutter_test_app/_all.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final ICommentsRepository commentsRepository;

  CommentsBloc({
    required this.commentsRepository,
  }) : super(initialState()) {
    on<CommentsLoadEvent>(_load);
  }

  static CommentsState initialState() =>
      CommentsState(status: CommentsStateStatus.loading, comments: []);

  Future<void> _load(
      CommentsLoadEvent event, Emitter<CommentsState> emit) async {
    emit(state.copyWith(status: CommentsStateStatus.loading));
    final commentDetails = await commentsRepository.getComments();
    if (commentDetails != null) {
      emit(state.copyWith(
          status: CommentsStateStatus.loaded, comments: commentDetails));
    } else {
      emit(state.copyWith(status: CommentsStateStatus.error));
    }
  }
}
