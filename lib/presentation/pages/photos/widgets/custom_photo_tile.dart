import 'package:flutter_test_app/_all.dart';

class CustomPhotoTile extends StatelessWidget {
  final String imageUrl;

  const CustomPhotoTile({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
