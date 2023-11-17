import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(
        enableSuggestions: false,
        autocorrect: false,
        style: const TextStyle(
          decoration: TextDecoration.none,
          color: Colors.green,
        ),
        cursorColor: Colors.green,
        decoration: InputDecoration(
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 15),
          hintStyle: const TextStyle(
            color: Colors.green,
          ),
          hintText: "Search...",
          filled: true,
          fillColor: Colors.white,
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.green,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(width: 1, color: Colors.green)

          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
              borderSide: const BorderSide(width: 1, color: Colors.green)
          ),
        ),
      ),
    );
  }
}
