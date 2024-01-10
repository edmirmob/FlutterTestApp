import 'package:flutter_test_app/_all.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final IUsersRepository usersRepository;

  UsersBloc({
    required this.usersRepository,
  }) : super(initialState()) {
    on<UsersLoadEvent>(_load);
  }

  static UsersState initialState() =>
      UsersState(status: UsersStateStatus.loading, users: []);

  Future<void> _load(UsersLoadEvent event, Emitter<UsersState> emit) async {
    emit(state.copyWith(status: UsersStateStatus.loading));
    final usersDetails = await usersRepository.getUsers();
    if (usersDetails != null) {
      emit(
          state.copyWith(status: UsersStateStatus.loaded, users: usersDetails));
    } else {
      emit(state.copyWith(status: UsersStateStatus.error));
    }
  }
}
