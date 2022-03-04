import 'dart:convert';
import 'dart:html' as html;
import 'dart:io' as io;
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker_web/image_picker_web.dart';

class StorageController {
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;
  final String _path = 'problems/';

  Future<String> getImageFromLink(String imageUrl) async {
    Reference ref = storage.ref().child(imageUrl);
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<html.File> getImageFromDevice() async {
    html.File? image = await ImagePickerWeb.getImageAsFile();
    return image!;
  }
  /* 
  Future<String> addImageStorage(html.File image) async {
    String url = '';
    io.File decodedImage = io.File('');
    final reader = html.FileReader();
    reader.readAsDataUrl(image);

    reader.onLoad.first.then((res) {
      final encoded = reader.result as String;
      final imageBase64 = encoded.replaceFirst(
          RegExp(r'data:image/[^;]+;base64,'),
          ''); // this is to remove some non necessary stuff
      decodedImage = io.File.fromRawPath(base64Decode(imageBase64));
    });

    TaskSnapshot snapshot =
        await storage.ref().child(_path).putFile(decodedImage);
    if (snapshot.state == TaskState.success) {
      url = await snapshot.ref.getDownloadURL();
      print(url);
    }
    return url;
  }*/

}
