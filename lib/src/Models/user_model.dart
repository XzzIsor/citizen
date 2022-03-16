// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);
import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.direccion,
    required this.email,
    required this.telefono,
    required this.password,
    required this.uid,
    required this.admin
    }
  );

  String id;
  String nombres;
  String apellidos;
  String direccion;
  String email;
  String telefono;
  String password;
  String uid;
  bool admin;

  UserModel copyWith(
          {required String id,
          required String nombres,
          required String apellidos,
          required String direccion,
          required String email,
          required String telefono,
          required String password,
          required String uid,
          required bool admin}) =>
      UserModel(
          id: id,
          nombres: nombres,
          apellidos: apellidos,
          direccion: direccion,
          email: email,
          telefono: telefono,
          password: password,
          uid: uid,
          admin: admin);

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      id: json["id"],
      nombres: json["nombres"],
      apellidos: json["apellidos"],
      direccion: json["direccion"],
      email: json["email"],
      telefono: json["telefono"],
      password: json["password"],
      uid: json["uid"],
      admin: json["admin"]);

  Map<String, dynamic> toMap() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "direccion": direccion,
        "email": email,
        "telefono": telefono,
        "password": password,
        "uid": uid,
        "admin": admin
      };
}
