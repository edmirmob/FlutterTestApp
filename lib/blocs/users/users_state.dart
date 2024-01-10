import 'package:flutter_test_app/_all.dart';

enum UsersStateStatus { initial, loading, loaded, error }

class UsersState {
  final List<Users> users;
  final UsersStateStatus status;
  final String errorMessage;

  UsersState({
    required this.users,
    required this.status,
    this.errorMessage = '',
  });

  factory UsersState.initial() {
    return UsersState(
      users: [],
      status: UsersStateStatus.initial,
      errorMessage: '',
    );
  }

  UsersState copyWith({
    List<Users>? users,
    UsersStateStatus? status,
    String? errorMessage,
  }) {
    return UsersState(
      users: users ?? this.users,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
