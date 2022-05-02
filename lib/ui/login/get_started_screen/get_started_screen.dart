import 'package:easy_localization/easy_localization.dart';
import 'package:ecom_app/data/service/firebase_storage_service.dart';
import 'package:ecom_app/style/app_colors.dart';
import 'package:ecom_app/style/app_gradient.dart';
import 'package:ecom_app/translations/locale_keys.g.dart';

import 'package:ecom_app/ui/login/enter_phone_screen/enter_phone_screen.dart';

import 'package:flutter/material.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  Duration _animationDuration = const Duration(seconds: 1);
  double _top = 450;
  // double _bottom = 10.0;
  // double _right = 10.0;
  double _left = 150;
  // Future<Widget?> getImage(BuildContext context, String imageName) async {
  //   Image? img;
  //   try {
  //     await FireBaseStorageService.loadFromStorage(context, imageName)
  //         .then((downloadUrl) {
  //       img = Image.network(
  //         downloadUrl.toString(),
  //         fit: BoxFit.scaleDown,
  //       );
  //     });
  //   } on FirebaseException catch (e) {
  //     // Caught an exception from Firebase.
  //     print("Failed with error '${e.code}': ${e.message}");
  //   }

  //   return img;
  // }
//   Future getImg() async {
//     // Create a storage reference from our app
//     final storageRef = FirebaseStorage.instance.ref();

// // Create a reference with an initial file path and name
//     // final pathReference = storageRef.child("product_img1.png");

// // // Create a reference to a file from a Google Cloud Storage URI
// //     final gsReference = FirebaseStorage.instance
// //         .refFromURL("gs://ecom-app-test-8e7ae.appspot.com/product_img1.png");

// // Create a reference from an HTTPS URL
// // Note that in the URL, characters are URL escaped!
//     // final httpsReference = FirebaseStorage.instance.refFromURL(
//     //     "https://firebasestorage.googleapis.com/b/YOUR_BUCKET/o/images%20stars.jpg");

//     final imageUrl =
//         await storageRef.child("images/start_img.gif").getDownloadURL();

//     return imageUrl;
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
          FutureBuilder<dynamic>(
            future:
                FireBaseStorageService().getImg('start_img.gif'), //getImg(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Image.network(
                    snapshot.data.toString(),
                    fit: BoxFit.fill,
                    //snapshot.data as Widget,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     fit: BoxFit.fitHeight,
                    //     image: AssetImage('assets/images/start_img.gif'),
                    //   ),
                    // ),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return Container();
            },
          ),
          AnimatedPositioned(
            duration: _animationDuration,
            top: _top,
            //   bottom: _bottom,
            //  right: _right,
            left: _left,

            child:
                // Positioned(
                //   left: _left,//150,
                //   top:_top,//340,
                //   child:
                Container(
              width: 269,
              height: 146,
              decoration: BoxDecoration(
                color: AppColors.yellow.withOpacity(0.7),
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(300)),
              ),
            ),
            //   ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            ////
            // top: 360, //560,
            //  bottom: 0,
            child: Container(
              height: 291,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                //color: Colors.purple,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                gradient: AppGradient.purpleGradient,
                // LinearGradient(
                //   colors: [
                //     Color.fromRGBO(52, 40, 60, 1),
                //     Color.fromRGBO(132, 95, 161, 1),
                //   ],
                //   begin: Alignment.centerLeft,
                //   end: Alignment.centerRight,
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 28,
                    ),
                    RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 31,
                        ),
                        children: [
                          TextSpan(
                            text: 'My',
                            style: TextStyle(color: AppColors.yellow),
                          ),
                          TextSpan(
                            text: 'Shop',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    ///////////////
                    const SizedBox(
                      height: 24,
                    ),
                    const Text(
                      'Lorem Ipsum is simply dummy text of the  printing and typesetting industry',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        FireBaseStorageService().getListImg();
                        Navigator.push<void>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EnterPhoneScreen(),
                          ),
                        );
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomeWidget()));
                        // setState(() {
                        //   _top=0;
                        // //  _right=200;
                        // //  _bottom=100;
                        //   _left=0;
                        // });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.yellow,
                        onPrimary: Colors.white,
                        minimumSize: const Size(239, 48),
                      ),
                      child: Text(
                        LocaleKeys.get_started.tr(),
                        // 'Get Started',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
