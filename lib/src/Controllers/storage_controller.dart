import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_io/io.dart';

class StorageController {
  final storage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;
  final String _path = 'problems/';
  final ImagePicker _picker = ImagePicker();

  Future<String> getImageFromLink(String imageUrl) async {
    Reference ref = storage.ref().child(imageUrl);
    final url = await ref.getDownloadURL();
    return url;
  }

  Future<XFile> getImageFromDevice() async {
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image!;
  }

  Future<List<String>> addImagesToStorage(List<XFile> images) async {
    List<String> urls = [];

    for (XFile image in images) {
      //Código no Funcional
      dynamic decodedImage = File(image.path);
      TaskSnapshot snapshot =
          await storage.ref().child(_path).putFile(decodedImage);

      if (snapshot.state == TaskState.success) {
        String url = await snapshot.ref.getDownloadURL();
        urls.add(url);
      }
    }

    return urls;
  }
}
