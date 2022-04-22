import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireBaseStorageService extends ChangeNotifier {
  FireBaseStorageService();

  Future getImg(String imageName) async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

    final imageUrl =
        // await storageRef.child("images/start_img.gif").getDownloadURL();
        await storageRef.child('images/$imageName').getDownloadURL();

    return imageUrl;
  }

  Future<List<String>> getListImg() async {
    final storageRef =
        FirebaseStorage.instance.ref().root.child('images/img_carousel');

    final listResult = await storageRef.listAll();

    var imgList = <String>[];

    for (var item in listResult.items) {
      imgList.add(item.fullPath);
      print(imgList);
    }

    return imgList;
  }

//   Stream<ListResult> listAllPaginated(Reference storageRef) async* {
//   String? pageToken;
//   do {
//     final listResult = await storageRef.list(ListOptions(
//       maxResults: 100,
//       pageToken: pageToken,
//     ));
//     yield listResult;
//     pageToken = listResult.nextPageToken;
//   } while (pageToken != null);
// }

  // static Future<dynamic> loadFromStorage(
  //     BuildContext context, String image) async {
  //   try {
  //     return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  //   } on FirebaseException catch (e) {
  //     // Caught an exception from Firebase.
  //     print("Failed with error '${e.code}': ${e.message}");
  //   }
  // }

  // static Future<dynamic> getImage(
  //     BuildContext context, String imageName) async {
  //   Image img;
  //   await FireBaseStorageService.loadFromStorage(context, imageName)
  //       .then((downloadUrl) {
  //     img = Image.network(
  //       downloadUrl.toString(),
  //       fit: BoxFit.scaleDown,
  //     );
  //   });

  //   return img;
  // }
}
