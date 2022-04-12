import 'package:ecom_app/ui/home/home_screen/catalogue_widget.dart';
import 'package:flutter/material.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/home/home_screen/clothing_widget.dart';

class CategoriesWidget extends StatefulWidget {
   //int pageIndex;

   CategoriesWidget({
    Key? key,
   // required this.pageIndex,
  }) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int pageIndex =0;
  @override
  Widget build(BuildContext context) {
    return  Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            showBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                )),
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 24),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Center(
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 33),
                                            child: Text(
                                              'Women`s Fashion',
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      AppColors.darkTextColor),
                                            ),
                                          ),
                                        ),

                                        const SizedBox(
                                          height: 12,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              // Navigator.push(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //   builder: (context) => const ClothingWidget()));
                                              setState(() {
                                               pageIndex =1;
                                              });
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                builder: (context) =>  const CatalogueWidget()));
                                            },
                                            child: const Text(
                                              'Clothing',
                                              style:  TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //    SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Shoes',
                                              style:  TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Jewelry',
                                              style:  TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Watches',
                                              style:  TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //     SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Handbags',
                                              style:  TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Accessories',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Man`s Fashion',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Girl`s Fashion',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        //      SizedBox(height: 8,),
                                        TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              'Boy`s Fashion',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .darkGreyTextColor),
                                            )),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                        ),
                      );
  }
}