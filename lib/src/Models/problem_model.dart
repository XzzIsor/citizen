// To parse this JSON data, do
//
//     final problemModel = problemModelFromMap(jsonString);

import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class ProblemModel {
  ProblemModel({
    required this.descripcion,
    required this.direccion,
    required this.estado,
    required this.fijado,
    required this.multimedia,
    required this.titulo,
    required this.ubicacion,
    required this.escritor,
    required this.progreso
  });

  String descripcion;
  String? id;
  String direccion;
  String estado;
  bool fijado;
  String titulo;
  List<dynamic> multimedia;
  GeoPoint ubicacion;
  String escritor;
  String progreso;

  ProblemModel copyWith({
    String? descripcion,
    String? direccion,
    String? estado,
    bool? fijado,
    String? titulo,
    List<String>? multimedia,
    GeoPoint? ubicacion,
    String? escritor,
    String? progreso
  }) =>
      ProblemModel(
        descripcion: descripcion ?? this.descripcion,
        direccion: direccion ?? this.direccion,
        estado: estado ?? this.estado,
        fijado: fijado ?? this.fijado,
        titulo: titulo ?? this.titulo,
        multimedia: multimedia ?? this.multimedia,
        ubicacion: ubicacion ?? this.ubicacion,
        escritor: escritor ?? this.escritor,
        progreso: progreso ?? this.progreso
      );

  factory ProblemModel.fromJson(String str) =>
      ProblemModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProblemModel.fromMap(Map<String, dynamic> json) => ProblemModel(
        descripcion: json["descripcion"],
        direccion: json["direccion"],
        estado: json["estado"],
        fijado: json["fijado"],
        multimedia: json["multimedia"],
        titulo: json["titulo"],
        ubicacion: json["ubicacion"],
        escritor: json["escritor"],
        progreso: json["progreso"]
      );

  Map<String, dynamic> toMap() => {
        "descripcion": descripcion,
        "direccion": direccion,
        "estado": estado,
        "fijado": fijado,
        "multimedia": multimedia,
        "titulo": titulo,
        "ubicacion": ubicacion,
        "escritor": escritor,
        "progreso": progreso
      };

  set setId(String id) {
    this.id = id;
  }
}
