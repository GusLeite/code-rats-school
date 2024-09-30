import 'package:flutter/material.dart';
import 'package:code_rats_school/pages/home/widgets/horizontal_list.dart';
import 'package:code_rats_school/pages/home/widgets/highlights_list.dart';
import 'package:code_rats_school/services/api_services.dart';
import 'package:code_rats_school/models/cursos_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServices apiServices = ApiServices();

  late Future<Cursos> cursos;

  @override
  void initState() {
    cursos = apiServices.getCursos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code Rats'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Destaques',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              FutureBuilder<Cursos>(
                future: cursos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HighlightList(cursos: snapshot.data!);
                  }
                  return const SizedBox();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Text(
                  'Meus Cursos',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                  ),
                ),
              ),
              FutureBuilder<Cursos>(
                future: cursos,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return HorizontalList(cursos: snapshot.data!);
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
