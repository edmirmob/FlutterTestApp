import 'package:flutter_test_app/_all.dart';

class CustomLimitPhoto extends StatelessWidget {
  const CustomLimitPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController limitController = TextEditingController();
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(context.translations.limitPerPage),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: limitController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              ElevatedButton(
                onPressed: () {
                  var limit = int.parse(limitController.text);
                  context
                      .read<PhotosBloc>()
                      .add(PhotosGetRangeEvent(limit: limit));
                },
                child: Text(context.translations.showResult),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
