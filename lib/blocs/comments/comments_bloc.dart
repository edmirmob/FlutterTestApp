import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_app/_all.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final ICommentsRepository eventsRepository;
  // final IHostRepository hostRepository;
  // final ILocationRepository locationRepository;

  CommentsBloc({
    required this.eventsRepository,
    // required this.hostRepository,
    // required this.locationRepository,
  }) : super(initialState()) {
    on<FetchComments>(_load);
    // on<EventDetailsRefreshEvent>(_refresh);
    // on<EventDetailsDeleteEvent>(_deleteEvent);
  }

  static CommentsState initialState() =>
      CommentsState(status: CommentsStateStatus.loading, comments: []);

  Future<void> _load(FetchComments event, Emitter<CommentsState> emit) async {
    emit(state.copyWith(status: CommentsStateStatus.loading));
    // final result = await eventsRepository.getDetails();
    // if (result != null) {
    //   emit(state.copyWith(status: CommentsStateStatus.loaded, eventDetails: result));
    // }
    final eventDetails = await eventsRepository.getDetails();

    if (eventDetails != null) {
      emit(state.copyWith(
          status: CommentsStateStatus.loaded, comments: eventDetails));
    } else {
      emit(state.copyWith(status: CommentsStateStatus.error));
    }
  }

  // Future<void> _refresh(EventDetailsRefreshEvent event, Emitter<CommentsState> emit) async {
  //   final eventDetails = await eventsRepository.getDetails(state.eventDetails?.id ?? 0);

  //   if (eventDetails != null) {
  //     emit(state.copyWith(status: CommentsStateStatus.loaded, eventDetails: Optional.of(eventDetails)));
  //   }
  // }

  // Future<void> _deleteEvent(EventDetailsDeleteEvent event, Emitter<CommentsState> emit) async {
  //   emit(state.copyWith(status: CommentsStateStatus.submitting));
  //   final response = await eventsRepository.deleteEvent(event.eventId);
  //   if (response != false) {
  //     emit(state.copyWith(status: CommentsStateStatus.deletedSuccessfully));
  //     emit(initialState());
  //   } else {
  //     emit(state.copyWith(status: EventDetailsStateStatus.error));
  //   }
  // }
}
