import 'package:flutter/material.dart';
import 'package:code_rats_school/models/cursos_model.dart';
import 'package:code_rats_school/pages/home/widgets/horizontal_item.dart';

class HorizontalList extends StatelessWidget {
  final Cursos cursos;
  const HorizontalList({super.key, required this.cursos});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cursos.cursos.length,
        itemBuilder: (context, index) {
          final curso = cursos.cursos[index];
          return HorizontalItem(curso: curso);
        },
      ),
    );
  }
}
