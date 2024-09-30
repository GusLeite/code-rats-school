import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:code_rats_school/common/utils.dart';
import 'package:code_rats_school/models/cursos_model.dart';

const baseUrl = 'http://localhost:8080/';

class ApiServices {
  Future<Cursos> getCursos() async {
    var endPoint = 'courses';
    final url = '$baseUrl$endPoint';


    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      if (response.statusCode == 200) {
        return Cursos.fromJson(jsonDecode(response.body));
      }
    } catch(e) {
      throw Exception('Failed to load data');
    }
    throw Exception('Failed to load data');
  }

  Future<Curso> getCurso(int cursoId) async {
    var endPoint = 'courses/$cursoId';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url));
      print(response.body);

      if (response.statusCode == 200) {
        return Curso.fromJson(jsonDecode(response.body));
      }
    } catch(e) {
      throw Exception('Failed to load data');
    }
    throw Exception('Failed to load data');
  }
}
