// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecom_app/data/models/product.dart';
// import 'package:ecom_app/style/app_gradient.dart';
// import 'package:ecom_app/ui/home/home_screen/bloc/home_screen_bloc.dart';
// import 'package:ecom_app/ui/product_page/product_page_screen/product_screen.dart';
// import 'package:ecom_app/ui/widgets/item_container.dart';
// import 'package:ecom_app/ui/widgets/navigation.dart';
// import 'package:ecom_app/ui/widgets/star_icon_list.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class ItemGridView extends StatelessWidget {
//   // final Stream<QuerySnapshot> collectRef;
//   //final Axis scrollDirections;
//   // final int itemCount;
//   // final String name;
//   // final String image;
//   // final String productId;
//   // final num price;
//   // final bool isFavorite;

//   final List<Product> products;
//   final ScrollPhysics physics;
//   final Function func1;
//   const ItemGridView({
//     required this.func1,
//     required this.products,
//     required this.physics,
//     //required this.collectRef,
//     //required this.scrollDirections,
//     // required this.image,
//     // required this.productId,
//     // required this.price,
//     // required this.isFavorite,
//     Key? key,
//   }) : super(key: key);

//   // bool favorite = false;
//   // int value = 0;
//   // CollectionReference products =
//   //     FirebaseFirestore.instance.collection('products');
//   // num val = 1;

//   @override
//   Widget build(BuildContext context) {
//     // return BlocBuilder<HomeScreenBloc,HomeScreenState>(
//     // StreamBuilder<QuerySnapshot>(
//     // stream:
//     // collectRef, //FirebaseFirestore.instance.collection('products').snapshots(),
//     // builder: (context, snaspshot) {
//     // return !snapshot.hasData
//     // builder: (context, state) {
//     // ?
//     //   if(state is HomeScreenLoading){
//     // const Center(
//     //     child: SizedBox(
//     //       width: 24,
//     //       height: 24,
//     //       child: CircularProgressIndicator(),
//     //     ),
//     //   );
//     // }
//     // :
//     //    if(state is HomeScreenLoaded){
//     // late Product product;

//     // return BlocBuilder<HomeScreenBloc, HomeScreenState>(
//     //   // BlocBuilder<HomeScreenBloc, HomeScreenState>(
//     //   builder: (context, state) {
//     //     if (state is HomeScreenLoading) {
//     //       const Center(
//     //         child: SizedBox(
//     //           width: 24,
//     //           height: 24,
//     //           child: CircularProgressIndicator(),
//     //         ),
//     //       );
//     //     }
//     //     if (state is HomeScreenLoaded) {
//     // bool isFavorite = state.products.first.isFavorite;

//     return GridView.builder(
//       //scrollDirection: //scrollDirections,
//       itemCount:
//           // state.products.length,
//           products
//               .length, //state.products.length, //snapshot.data?.docs.length, //6,
//       physics: physics, // const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount:
//             MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
//         crossAxisSpacing: 8,
//         mainAxisSpacing: 8,
//         mainAxisExtent: 260,
//         childAspectRatio: 2 / 2,
//       ),
//       itemBuilder: (context, index) {
//         // final DocumentSnapshot? data = snapshot.data?.docs[index];
//         // final String productId = data?.id ?? '';
//         // var idx = state.products[index];
//         // var id = state.products.where((element) => element.category);
//         // return ItemContainer(data: data, productId: productId);
//         // _updateFavorite() {
//         //   bool isFav = state.products[index].isFavorite;

//         //   for (var item in state.products) {
//         //     return product = item;
//         //   }

//         //   context.read<HomeScreenBloc>().add(
//         //         HomeScreenProductFavoriteUpdate(
//         //           product,
//         //           // state.products[index], // state.products.first,
//         //           !isFav,
//         //           // state.products.where((element) => element.isFavorite)
//         //           //     as bool,
//         //           // state.products.map((e1) => e1.isFavorite).first,
//         //           // state.products.map((e) => e.id).toString(),
//         //         ),
//         //       );
//         // }

//         return ItemContainer(
//           product: products[index], // state.products[index],
//           func2: func1, //_updateFavorite, //func1,
//         );
//       },
//     );
//     //     }
//     //     ;
//     //     return Text('Error');
//     //   },
//     // );
//     // }
//     // return const Text('');

//     // },
//     // );
//   }
// }
