// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class User {
    User({
        required this.id,
        required this.nombres,
        required this.apellidos,
        required this.direccion,
        required this.email,
        required this.telefono,
        required this.password,
    });

    int id;
    String nombres;
    String apellidos;
    String direccion;
    String email;
    int telefono;
    String password;

    User copyWith({
        required int id,
        required String nombres,
        required String apellidos,
        required String direccion,
        required String email,
        required int telefono,
        required String password,
    }) => 
        User(
            id: id,
            nombres: nombres,
            apellidos: apellidos,
            direccion: direccion,
            email: email,
            telefono: telefono,
            password: password,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        direccion: json["direccion"],
        email: json["email"],
        telefono: json["telefono"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nombres": nombres,
        "apellidos": apellidos,
        "direccion": direccion,
        "email": email,
        "telefono": telefono,
        "password": password,
    };
}
