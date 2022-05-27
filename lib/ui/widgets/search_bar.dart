import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/routes/app_router.gr.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

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
          context.router.push(const SearchRoute());
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
