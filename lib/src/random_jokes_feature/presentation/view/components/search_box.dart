import 'package:flutter/material.dart';
import 'package:jokes/src/search_jokes_feature/presentation/view/search_joke_screen.dart';

class SearchBar extends StatefulWidget {
  const SearchBar(
      {required this.isEditMode,
      this.onIconClicked,
      this.onTextChanged,
      required this.icon,
      super.key});

  final bool isEditMode;
  final IconData icon;
  final VoidCallback? onIconClicked;
  final Function(String)? onTextChanged;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEditMode
          ? null
          : () {
              Navigator.pushNamed(context, SearchJokeScreen.routeName);
            },
      child: Card(
        shadowColor: Colors.amber,
        elevation: 10,
        child: Row(
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: widget.onIconClicked,
                icon: Icon(widget.icon)),
            const SizedBox(width: 8),
            Flexible(
                child: TextField(
              enabled: widget.isEditMode,
              controller: _controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText:
                      widget.isEditMode ? "Type to search" : "Click to search"),
              onChanged: (value) {
                widget.onTextChanged!(value);
              },
            ))

            // widget.isEditMode ? TextField() : Container()
            // TextField(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
