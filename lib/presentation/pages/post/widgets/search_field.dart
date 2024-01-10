import 'package:flutter_test_app/_all.dart';

class SearchField extends StatefulWidget {
  final void Function(String text) onSearchChanged;
  final String label;
  final EdgeInsets padding;

  const SearchField({
    required this.onSearchChanged,
    required this.label,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: TextFormField(
        cursorColor: context.theme.primaryColor,
        style: TextStyle(
            color: context.theme.primaryColor, fontWeight: FontWeight.w400),
        onChanged: (String term) => _onSearchChanged(term),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          prefixIcon: Icon(
            Icons.search_sharp,
            color: context.theme.primaryColor,
            size: 25,
          ),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: widget.label,
          hintStyle: TextStyle(
            color: context.theme.primaryColor,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }
}
