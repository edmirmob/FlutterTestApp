abstract class PostDetailsEvent {}

class PostDetailsLoadByIdEvent extends PostDetailsEvent {
  final int? postId;

  PostDetailsLoadByIdEvent({this.postId});
}
