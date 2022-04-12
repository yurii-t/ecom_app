import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/home/home_screen/categories_widget.dart';

import 'clothing_widget.dart';

class CatalogueWidget extends StatefulWidget {

  
 
   const CatalogueWidget({
    Key? key,
   
  }) : super(key: key);

  @override
  State<CatalogueWidget> createState() => _CatalogueWidgetState();
}

class _CatalogueWidgetState extends State<CatalogueWidget> {
  int _pageIndex=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backGroundColor,
      body: IndexedStack(
        index: _pageIndex,
        children:[ 
          Column(
            children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 132,
                decoration: const BoxDecoration(
                  gradient: AppColors.purpleGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       GestureDetector(
                          onTap: (){
                            // Navigator.of(context).pop();
                            setState(() {
                              _pageIndex=0;
                            });
                          },
                          child: SvgPicture.asset('icons/arrow_left.svg')),
                      // const Icon(
                      //   Icons.menu,
                      //   color: Colors.white,
                      // ),
                     const Text('Catalogue',
                        style: TextStyle(
                                     fontWeight: FontWeight.w700,
                                      fontSize: 19,
                                      color: Colors.white,
                                      ),
                                     ), 
                      // const Icon(Icons.notifications_outlined,
                      //     color: Colors.white),
                      SvgPicture.asset('icons/bell_1.svg'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 108,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: 375,
                    height: 44,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40)),
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'What are you looking for',
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 36),
          Expanded(
            child: SizedBox(
              //  width: MediaQuery.of(context).size.width,
              //  height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // padding: EdgeInsets.only(top:70),
                  // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  itemCount: 8,
                  itemExtent: 120, //88,
                  itemBuilder: (BuildContext context, int index) {
                    return // Padding(padding: EdgeInsets.symmetric(horizontal:16, vertical:10),
                        // child:
                        Stack(
                      //  fit: StackFit.passthrough,
                      children: [
                        Container(
                          height: 176,
                          margin: const EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          //padding: EdgeInsets.only(left: ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Colors.black.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
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
                              const Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 16,
                                  ),
                                  child: Text(
                                    'Women`s Fashion',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.darkTextColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Image.asset(
                                'images/img_gal.jpg',
                                width: 88,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                        // CategoriesWidget()
                        Material(
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
                                                setState(() {
                                                  _pageIndex =1;
                                                });
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
                        ),
                      ],
                    );
      
                    //   );
                  }),
            ),
          )
        ]
        ),
        const ClothingWidget(),
        ]
      ),
    ));
  }
}
