import 'package:flutter_test_app/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class PhotosGallery extends StatelessWidget {
  const PhotosGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhotosBloc, PhotosState>(
      listener: (context, photosState) {
        if ([PhotosStateStatus.loaded, PhotosStateStatus.loadedMore]
            .contains(photosState.status)) {
          refreshController.loadComplete();
        }

        if (photosState.status == PhotosStateStatus.refreshed) {
          refreshController.refreshCompleted();
        }
      },
      builder: (context, galleryState) {
        return SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onLoading: () {
            context.read<PhotosBloc>().add(PhotosLoadMoreEvent());
          },
          onRefresh: () {
            context.read<PhotosBloc>().add(PhotosRefreshEvent());
          },
          child: () {
            if (galleryState.status == PhotosStateStatus.loading) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.white,
                ),
              );
            }

            if (galleryState.photos.isEmpty) {
              return Center(
                child: Text(context.translations.noPhotos),
              );
            }

            return GridView.builder(
              itemCount: galleryState.photos.length,
              itemBuilder: (context, index) => CustomPhotoTile(
                  imageUrl: galleryState.photos[index].url.toString()),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
            );
          }(),
        );
      },
    );
  }
}
