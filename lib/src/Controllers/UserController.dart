import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final firestore = FirebaseFirestore.instance;
  static List<UserModel> users = [];

  Future<List<UserModel>> getUsers() async {
    await firestore.collection("user").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            UserModel user = UserModel.fromMap(element.data());
            print(user.nombres);
            print(user.apellidos);
            users.add(user);
          })
        });

    return users;
  }

  Future<void> registerUser({required UserModel user}) async {
    firestore.collection("user").add({
      "apellidos": user.apellidos,
      "direccion": user.direccion,
      "email": user.email,
      "id": user.id,
      "nombres": user.nombres,
      "password": user.password,
      "telefono": user.telefono
    });
  }

  bool authUser({required String email, required String password}) {
    print(users);

    for (var user in users) {
      if (email == user.email && password == user.password) {
        return true;
      }
    }
    return false;
  }
}
