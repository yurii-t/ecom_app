import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/home/filter_screen/filter_widget.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClothingWidget extends StatefulWidget {
  const ClothingWidget({Key? key,required 
  this.onBackButtonPressed
  }) : super(key: key);
     final Function() onBackButtonPressed;
  @override
  State<ClothingWidget> createState() => _ClothingWidgetState();
}

class _ClothingWidgetState extends State<ClothingWidget> {
  int _selectedTab = 0;

  String dropdownvalue = 'Featured';
  var dropButtonItems = [
    'Featured',
    'New',
    'Popular',
    'Price high to low',
    'Price low to high',
  ];
  late String _currentItemSelected;

  @override
  void initState() {
    super.initState();
    _currentItemSelected = dropButtonItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: Column(children: [
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
                        onTap:
                         widget.onBackButtonPressed,
                        child: SvgPicture.asset('icons/arrow_left.svg')),
                      // const Icon(
                      //   Icons.menu,
                      //   color: Colors.white,
                      // ),
                      // 
                      const Text('Clothing',
                      style: TextStyle(
                                   fontWeight: FontWeight.w700,
                                    fontSize: 19,
                                    color: Colors.white,
                                    ),
                                   ), 


                      // RichText(
                      //     text: const TextSpan(
                      //         style: TextStyle(
                      //             fontWeight: FontWeight.w700, fontSize: 18),
                      //         children: [
                      //       TextSpan(
                      //           text: 'My',
                      //           style: TextStyle(color: AppColors.yellowColor)),
                      //       TextSpan(
                      //           text: 'Shop',
                      //           style: TextStyle(color: Colors.white)),
                      //     ])),
                      // const Icon(Icons.notifications_outlined,
                      //     color: Colors.white),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FilterWidget()));
                        },
                        child: SvgPicture.asset('icons/filter_icon.svg')),
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
          const SizedBox(
            height: 34,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
                itemCount: 10,
                itemExtent: 88,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTab = index;
                        });
                      },
                      child: Container(
                        height: 26,
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 4, bottom: 4),
                        // width: 88,
                        // height: 88,
                        decoration: BoxDecoration(
                          color: _selectedTab == index
                              ? AppColors.yellowColor
                              : Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40)),
                        ),
                        child: Center(
                          child: Text('All',
                              style: TextStyle(
                                  color: _selectedTab == index
                                      ? Colors.white
                                      : AppColors.darkGreyTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    '166 items',
                    style: TextStyle(
                        fontSize: 19,
                        color: AppColors.darkTextColor,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Sort by:',
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    //  Icon(
                    //   Icons.chevron_right,
                    //   color:  AppColors.greyTextColor,
                    // )

                    PopupMenuButton<String>(
                      itemBuilder: (context) {
                        return dropButtonItems.map((str) {
                          return PopupMenuItem(
                            value: str,
                            child: Text(str),
                          );
                        }).toList();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(_currentItemSelected),
                          //Icon(Icons.arrow_drop_down),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      onSelected: (v) {
                        setState(() {
                          print('!!!===== $v');
                          _currentItemSelected = v;
                        });
                      },
                    ),

                    // ButtonTheme(
                    //   alignedDropdown: true,
                    //   child: DropdownButton(
                    //    // isDense: true,
                    //   // isExpanded: true,
                    //     value: dropdownvalue,
                    //    // underline: const SizedBox(),
                    //     icon:
                    //     //Icon(Icons.chevron_right),
                    //     const Icon(Icons.keyboard_arrow_down),
                    //     // selectedItemBuilder: (context) => [for (final item in dropButtonItems) dropdownvalue],
                    //     items: dropButtonItems.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropdownvalue = newValue!;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 19,),
          Expanded(
                child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 3
                          : 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 260,
                      childAspectRatio: (2 / 2),
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdutPageWidget()));
                        },
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 163,
                                  height: 163,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            'images/img_content.png'),
                                      )),
                                ),
                                Positioned(
                                  top: 8,
                                  child: Container(
                                    width: 47,
                                    height: 20,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          bottomRight: Radius.circular(40)),
                                      gradient: AppColors.orangeGradient,
                                    ),
                                    child: const Center(
                                        child:  Text(
                                      '-50%',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    )),
                                  ),
                                ),
                                Positioned(
                                  top: 145,
                                  //right: 0,
                                  left: 110,
                                   child:
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        shape: const CircleBorder(),
                                        // padding: EdgeInsets.all(36),
                                      ),
                                     

                                      onPressed: () {},
                                      child: SvgPicture.asset('icons/heart11.svg',color: Colors.purple), 
                                      
                                          ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 12,
                                        color: AppColors.starIconColor,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'ECOWISH Womens Color Block Striped Draped K kslkfajklsajlk',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    '\$102.33',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              )

        ]),
      ),
    );
  }
}
