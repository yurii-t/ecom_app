import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/search_screen/search_screen.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: 375,
      height: 44,
      child: TextField(
        onTap: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          prefixIcon: const Icon(Icons.search),
          hintText: LocaleKeys.home_searchbar.tr(),
        ),
      ),
    );
  }
}
