abstract class PostsEvent {}

class PostsLoadEvent extends PostsEvent {}

class PostsFiltersLoadEvent extends PostsEvent {
  final int? id;

  PostsFiltersLoadEvent({
    this.id,
  });
}
