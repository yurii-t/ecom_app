import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/ui/home/home_screen/catalogue_widget.dart';
import 'package:ecom_app/ui/product_page/product_page_screen/product_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreenContentWidget extends StatefulWidget {
  const HomeScreenContentWidget({Key? key}) : super(key: key);

  @override
  State<HomeScreenContentWidget> createState() => _HomeScreenContentWidgetState();
}

class _HomeScreenContentWidgetState extends State<HomeScreenContentWidget> {
  
    int _sliderCurrent = 0;
  final CarouselController _sliderController = CarouselController();
  final List<String> imgSlider =[
    'images/img_gal.jpg',
    'images/img_content.png',
    'images/catalogue_img.png',
    'images/content_img1.png'];
  @override
  Widget build(BuildContext context) {
    return Column(
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
                          SvgPicture.asset('icons/menu_alt_2_1.svg'),
                          // const Icon(
                          //   Icons.menu,
                          //   color: Colors.white,
                          // ),
                          RichText(
                              text: const TextSpan(
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18),
                                  children: [
                                TextSpan(
                                    text: 'My',
                                    style: TextStyle(color:AppColors.yellowColor)),
                                TextSpan(
                                    text: 'Shop',
                                    style: TextStyle(color: Colors.white)),
                              ])),
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
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Stack(alignment: AlignmentDirectional.center, children: [


                  SizedBox(
                    width: 343,
                    height: 88,
                    child:// Column(children: [
                          CarouselSlider.builder(
                            itemCount: imgSlider.length,
                            carouselController: _sliderController,
                            options: CarouselOptions(
                              viewportFraction: 1,
                                autoPlay: true,
                                enlargeCenterPage: false,
                               // aspectRatio: 2.0,
                                onPageChanged: (index, reason) {
                    setState(() {
                      _sliderCurrent = index;
                    });
                     
                                }
                                
                                ),
                               itemBuilder: (context, index,realIdx){
                            return   Container(
                    width: 343,
                    height: 88,
                    decoration:  BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imgSlider[index]),
                        )
                        ),
                            );
                          }, 
                          ),
                      //     Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: imgSlider.asMap().entries.map((entry) {
                      //         return GestureDetector(
                      //           onTap: () => _sliderController.animateToPage(entry.key),
                      //           child: Container(
                      //             width: 12.0,
                      //             height: 12.0,
                      //             margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      //             decoration: BoxDecoration(
                      // shape: BoxShape.circle,
                      // color: (Theme.of(context).brightness == Brightness.dark
                      //         ? Colors.white
                      //         : Colors.black)
                      //     .withOpacity(_sliderCurrent == entry.key ? 0.9 : 0.4)),
                      //           ),
                      //         );
                      //       }).toList(),
                      //     )
                       // ]),
                  ),

                   Positioned(
                     top:75,
                     child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgSlider.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => _sliderController.animateToPage(entry.key),
                                  child: Container(
                                    width: 62.0,
                                    height: 2.0,
                                    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                       // shape: BoxShape.rectangle,
                       borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white)
                            .withOpacity(_sliderCurrent == entry.key ? 0.9 : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                   ),

        //           Container(
        //             width: 343,
        //             height: 88,
        //             decoration: const BoxDecoration(
        //                 borderRadius: BorderRadius.all(Radius.circular(8)),
        //                 // image: DecorationImage(
        //                 //   fit: BoxFit.fill,
        //                 //   image: AssetImage('images/img_gal.jpg'),
        //                 //)
        //                 ),
        //                 child: CarouselSlider.builder(
        //                   itemCount: imgSlider.length,
        //                   itemBuilder: (context, index,realIdx){
        //                     return Center(child: Image.asset(imgSlider[index],
        //                     fit: BoxFit.fill,width: 343,height: 88,)
        //                     );
        //                   }, 
        //                   options: CarouselOptions(
        //   autoPlay: true,
        //   aspectRatio: 2.0,
        //   enlargeCenterPage: true,
        // ),
        // ),
             //     ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18, top: 14, right: 177),
                    child: Column(
                      children: [
                        const Text(
                          'Fashion Sale',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          children:const [
                            Text(
                              'See More',
                              style: TextStyle(
                                color: AppColors.yellowColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: AppColors.yellowColor,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Catalogue',
                      style: TextStyle(
                          fontSize: 19,
                          color:AppColors.darkTextColor,
                          fontWeight: FontWeight.w700),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const CatalogueWidget()));
                      },
                      child: Row(
                        children:const [
                           Text(
                            'See All',
                            style: TextStyle(
                              color:  AppColors.greyTextColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),
                          ),
                           Icon(
                            Icons.chevron_right,
                            color:  AppColors.greyTextColor,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: 5,
                    // itemExtent: 88,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 88,
                          height: 88,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/img_gal.jpg'),
                              )),
                          child: const Center(
                            child: Text('Phones',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 32,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Featured',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700)),
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
                                      // ShaderMask(
                                      //     shaderCallback: (Rect bounds) {
                                      //       return AppColors.purpleGradient.createShader(bounds);
                                      //       // const LinearGradient(
                                      //       //   colors: [
                                      //       //      Color.fromRGBO(52, 40, 60, 1),
                                      //       //      Color.fromRGBO(132, 95, 161, 1),
                                      //       //   ],
                                      //       //   begin: Alignment.centerLeft,
                                      //       //   end: Alignment.centerRight,
                                      //       // ).createShader(bounds);
                                      //     },
                                      //       child:SvgPicture.asset('icons/heart.svg',), 
                                      //     //const Icon(
                                      //     //   Icons.favorite_outline,
                                      //     //   size: 15,
                                      //   //  )
                                      //     )
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
          );
  }
}