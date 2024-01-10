abstract class PhotosEvent {}

class PhotosLoadEvent extends PhotosEvent {}

class PhotosRefreshEvent extends PhotosEvent {}

class PhotosLoadMoreEvent extends PhotosEvent {}

class PhotosGetRangeEvent extends PhotosEvent {
  int? page;
  int? limit;
  PhotosGetRangeEvent({this.limit});
}
