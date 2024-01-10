import 'package:flutter_test_app/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PhotosPage extends StatefulWidget {
  static const routeName = '/photos';

  const PhotosPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

final refreshController = RefreshController(initialRefresh: false);

class _PhotosPageState extends State<PhotosPage> {
  @override
  void initState() {
    context.read<PhotosBloc>().add(PhotosLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translations.photosGallery),
      ),
      body:
          BlocBuilder<PhotosBloc, PhotosState>(builder: (context, photoState) {
        return const Column(
          children: [
            Gap(10),
            CustomLimitPhoto(),
            Expanded(child: PhotosGallery()),
          ],
        );
      }),
    );
  }
}
