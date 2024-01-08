import 'package:flutter_test_app/_all.dart';

abstract class ICommentsRepository {
  Future<List<Comments>?> getDetails();
}

class CommentsRepository implements ICommentsRepository {
  final RestApiClient restApiClient;
  // final dio = Dio();
  // final IStorageRepository storageRepository;

  CommentsRepository({
    required this.restApiClient,
    // required this.storageRepository,
  });

  @override
  Future<List<Comments>?> getDetails() async {
    final response = await restApiClient.get('/comments');
    if (response.statusCode == 200) {
      final List<Comments> comments = (response.data)
          .map((jsonComment) => Comments.fromMap(jsonComment))
          .toList();
      return comments.toList();

      //   return Comments.fromMap(response.data);
    }
  }
  // @override
  // Future<List<Event>?> getUpcomingThisWeekend(EventsThisWeekendSearchModel model) async {
  //   try {
  //     final response = await restApiClient.post(
  //       '/products/upcoming-weekend',
  //       data: model.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json))?.toList();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<List<Event>?> getNearYou(EventsNearYouSearchModel model) async {
  //   try {
  //     final response = await restApiClient.post(
  //       '/products/near-by',
  //       data: model.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json))?.toList();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<List<Event>?> getByHost(EventsByHostSearchModel model) async {
  //   try {
  //     final response = await restApiClient.post(
  //       '/products/by-vendor',
  //       data: model.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json))?.toList();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<List<Comments>?> getMyListings(MyListingsSearchModel model) async {
  //   try {
  //     final response = await restApiClient.postAndCache(
  //       '/2.0/products/my-listings',
  //       data: model.toMap(),
  //     );
  //     return response.items?.map<Comments>((json) => Comments.fromMap(json))?.toList();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<List<Event>?> getMyListingsCached(MyListingsSearchModel model) async {
  //   try {
  //     final response = await restApiClient.postCached(
  //       '/2.0/products/my-listings',
  //       data: model.toMap(),
  //     );
  //     return response.items?.map<Event>((json) => Event.fromMap(json))?.toList();
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<List<EventFilter?>?> getFiltersSpecification(int? categoryId) async {
  //   try {
  //     final response = await restApiClient.get(
  //       '/products/filters',
  //       queryParameters: {
  //         'categoryId': categoryId,
  //       },
  //     );

  //     final result = FiltersSpecification.fromMap(response.result);

  //     return result.attributes;
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // @override
  // Future<List<Attribute?>?> getSpecificationAtribut() async {
  //   try {
  //     final response = await restApiClient.get(
  //       '/products/specification-attributes',
  //     );

  //     final result = ProductSpecification.fromMap(response.result);

  //     return result.attributes;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  // @override
  // Future<List<ProductCategoriesResult?>?> getCategoriesResult() async {
  //   try {
  //     final response = await restApiClient.get(
  //       '/products/product-categories',
  //     );

  //     final result = ProductCategories.fromMap(response.data);

  //     return result.result;
  //   } catch (e) {
  //     return [];
  //   }
  // }

  // @override
  // Future<List<Event>?> advancedSearchEvents(EventsAdvancedSearchModel searchModel) async {
  //   restApiClient.exceptionOptions.showNetworkErrors = false;

  //   try {
  //     final response = await restApiClient.postAndCache(
  //       '/products/search-advanced',
  //       data: searchModel.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json)).toList();
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // @override
  // Future<List<Event>?> getCachedAdvancedSearchEvents(EventsAdvancedSearchModel searchModel) async {
  //   try {
  //     final response = await restApiClient.postCached(
  //       '/products/search-advanced',
  //       data: searchModel.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json)).toList();
  //   } catch (e) {
  //     print(e);
  //     return [];
  //   }
  // }

  // @override
  // Future<List<Event>?> searchEvents(EventsSearchModel searchModel) async {
  //   try {
  //     final response = await restApiClient.postAndCache(
  //       '/products/search',
  //       data: searchModel.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json)).toList();
  //   } catch (e) {
  //     print(e);
  //   }

  //   return null;
  // }

  // @override
  // Future<List<Event>?> searchCachedEvents(EventsSearchModel searchModel) async {
  //   try {
  //     final response = await restApiClient.postCached(
  //       '/products/search',
  //       data: searchModel.toMap(),
  //     );

  //     return response.items?.map<Event>((json) => Event.fromMap(json)).toList();
  //   } catch (e) {
  //     print(e);
  //   }

  //   return null;
  // }

  // @override
  // Future<Guests?> getGuests(GuestsSearchModel model) async {
  //   try {
  //     final response = await restApiClient.post(
  //       '/2.0/products/guests',
  //       data: model.toMap(),
  //     );

  //     return Guests.fromMap(response.result);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<bool> acceptGuest(AcceptGuestModel model) async {
  //   try {
  //     await restApiClient.post(
  //       '/products/accept-guest/',
  //       data: model.toMap(),
  //     );

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // @override
  // Future<bool> declineGuest(DeclineGuestModel model) async {
  //   try {
  //     await restApiClient.post(
  //       '/products/decline-guest/',
  //       data: model.toMap(),
  //     );
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // @override
  // Future<GuestsPreview?> guestsPreview(GuestsSearchModel model) async {
  //   try {
  //     final response = await restApiClient.post(
  //       '/2.0/products/guests-preview',
  //       data: model.toMap(),
  //     );

  //     return GuestsPreview.fromMap(response.result);
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<bool> addEvent(EventAddModel model) async {
  //   try {
  //     restApiClient.options.contentType = RestApiClientKeys.multipartFormData;
  //     await restApiClient.post(
  //       '/products',
  //       data: FormData.fromMap(await model.toMap()),
  //     );
  //     restApiClient.options.contentType = Headers.jsonContentType;

  //     return true;
  //   } catch (e) {
  //     restApiClient.options.contentType = Headers.jsonContentType;
  //     print(e);
  //     return false;
  //   }
  // }

  // @override
  // Future<EventUpdateModel?> updateEvent(EventUpdateModel model) async {
  //   final id = model.id!;
  //   try {
  //     restApiClient.options.contentType = RestApiClientKeys.multipartFormData;

  //     await restApiClient.put(
  //       '/products',
  //       data: FormData.fromMap(await model.toMap()),
  //     );
  //     restApiClient.options.contentType = Headers.jsonContentType;

  //     final updateResponse = await restApiClient.get('/products/$id');
  //     final update = EventUpdateModel.fromDetails(EventDetails.fromMap(updateResponse.result)!);

  //     return update;
  //   } catch (e) {
  //     print(e);

  //     restApiClient.options.contentType = Headers.jsonContentType;
  //     return null;
  //   }
  // }

  // @override
  // Future<EventUpdateModel?> prepareForEventUpdate(int id) async {
  //   try {
  //     final response = await restApiClient.get('/products/$id');

  //     final event = EventUpdateModel.fromDetails(EventDetails.fromMap(response.result)!);

  //     return event;
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // @override
  // Future<bool?> deleteEvent(int id) async {
  //   try {
  //     await restApiClient.post('/products/$id/cancel');

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // @override
  // Future<bool?> deleteEventPicture(int pictureId, int productId) async {
  //   try {
  //     await restApiClient.delete(
  //       '/products/delete-product-picture',
  //       data: {'pictureId': pictureId, 'productId': productId},
  //     );

  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
