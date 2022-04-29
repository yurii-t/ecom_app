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
}
