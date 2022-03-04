import 'package:citizen/src/Models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController {
  final firestore = FirebaseFirestore.instance;
  static List<UserModel> _users = [];
  static UserModel _authUser = UserModel(
      id: 'invalid',
      nombres: 'invalid',
      apellidos: 'invalid',
      direccion: 'invalid',
      email: 'invalid',
      telefono: 'invalid',
      password: 'invalid');

  Future<List<UserModel>> getUsers() async {
    await firestore.collection("user").get().then((snapshot) => {
          snapshot.docs.forEach((element) {
            UserModel user = UserModel.fromMap(element.data());
            _users.add(user);
          })
        });

    return _users;
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

  void authenticateUser(
      {required String email, required String password}) {
    for (var user in _users) {
      if (email == user.email && password == user.password) {
        _authUser = user;
      }
    }
  }

  UserModel get authUser => _authUser;

  set authUser(UserModel user) {
    _authUser = user;
  }
}
