import 'dart:convert';
import 'package:code_rats_school/common/utils.dart';

class Cursos {
  List<Curso> cursos;

  Cursos({
    required this.cursos,
  });

  factory Cursos.fromRawJson(String str) => Cursos.fromJson(json.decode(str));

  factory Cursos.fromJson(List<dynamic> json) => Cursos(
        cursos: List<Curso>.from(json.map((x) => Curso.fromJson(x))),
      );
}

class Curso {
  int id;
  String name;
  String imgurl;
  String description;
  double rating;
  int duration;

  Curso({
    required this.id,
    required this.name,
    required this.imgurl,
    required this.description,
    required this.rating,
    required this.duration,
  });

  factory Curso.fromRawJson(String str) => Curso.fromJson(json.decode(str));

  factory Curso.fromJson(Map<String, dynamic> json) => Curso(
        id: json["id"],
        name: json["name"] ?? "",
        imgurl: json["imgURL"] ?? " ",
        description: json["description"] ?? " ",
        rating: json["rating"],
        duration: json["duration"],
      );
}

class Aula {
  int id;
  String name;
  String imgurl;
  String description;

  Aula({
    required this.id,
    required this.name,
    required this.imgurl,
    required this.description,
  });

  factory Aula.fromRawJson(String str) => Aula.fromJson(json.decode(str));

  factory Aula.fromJson(Map<String, dynamic> json) => Aula(
        id: json["id"],
        name: json["name"] ?? "",
        imgurl: json["imgurl"] ?? " ",
        description: json["description"] ?? " ",
      );
}