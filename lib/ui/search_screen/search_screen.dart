import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/blocs/search/bloc/search_bloc.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';
import 'package:ecom_app/ui/widgets/navigation.dart';
import 'package:ecom_app/ui/widgets/star_icon_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGround,
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              const Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (state is SearchLoaded) {
              return ListView(children: [
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 132,
                      decoration: const BoxDecoration(
                        gradient: AppGradient.purpleGradient,
                      ),
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigation.mainListNav.currentState
                                  ?.popAndPushNamed(
                                'home_screen/home_content_screen',
                              );
                            },
                            child:
                                SvgPicture.asset('assets/icons/arrow_left.svg'),
                          ),
                          const Text(
                            'Search',
                            // 'Catalogue',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 19,
                              color: Colors.white,
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/icons/arrow_left.svg',
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 108,
                      child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        width: 375,
                        height: 44,
                        child: TextField(
                          onChanged: (value) =>
                              context.read<SearchBloc>().add(SearchLoad(value)),
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
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                SizedBox(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.products.length,
                    itemExtent: 120, //88,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigation.mainAppNav.currentState?.pushNamed(
                            '/home_screen/product_screen',
                            arguments: state.products[index].id, //productId,
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              height: 176,
                              margin: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 8,
                                bottom: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              clipBehavior: Clip.hardEdge,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.products[index].name,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.darkText,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          StarIconList(
                                            productId: state.products[index].id,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            '\$${state.products[index].price}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.darkText,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Image.network(
                                    state.products[index].imageUrl,
                                    fit: BoxFit.cover,
                                    height: 176,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ]);
            }
            ;
            return Text('Error');
          },
        ),
      ),
    );
  }
}
