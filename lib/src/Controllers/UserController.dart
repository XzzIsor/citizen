import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final firestore = FirebaseFirestore.instance;
  List<User> users = [];

  Future<List<User>> getUsers() async {
    await firestore.collection("user").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            User user = User.fromMap(element.data());
            print(user.nombres);
            print(user.apellidos);
            users.add(user);
          })
        });

    return users;
  }
}
