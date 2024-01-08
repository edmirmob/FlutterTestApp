abstract class CommentsEvent {}

class EventDetailsRefreshEvent extends CommentsEvent {}

class FetchComments extends CommentsEvent {}
// class EventDetailsLoadEvent extends CommentsEvent {
//   final int id;

//   EventDetailsLoadEvent({required this.id});
// }

// class EventDetailsDeleteEvent extends CommentsEvent {
//   final int eventId;
//   EventDetailsDeleteEvent({
//     required this.eventId,
//   });
// }
