import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({Key? key}) : super(key: key);

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
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
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 88,
            decoration: const BoxDecoration(
              gradient: AppColors.purpleGradient,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: SvgPicture.asset('icons/arrow_left.svg')),
                  const Text(
                    'Favorite',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
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
                    '5 items',
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
                      'Sort by: ',
                      style: TextStyle(
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
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
                          Text(_currentItemSelected + ' '),
                          SvgPicture.asset('icons/dropdown.svg'),
                          // const Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      onSelected: (v) {
                        setState(() {
                          print('!!!===== $v');
                          _currentItemSelected = v;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
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
                              builder: (context) => const ProdutPageWidget()));
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
                                    image: AssetImage('images/img_content.png'),
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
                                    child: Text(
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: const CircleBorder(),
                                  // padding: EdgeInsets.all(36),
                                ),
                                onPressed: () {},
                                child: SvgPicture.asset(
                                  'icons/favorite_heart.svg',
                                ),
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
        ],
      ),
    );
  }
}
