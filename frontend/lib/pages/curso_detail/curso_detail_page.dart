import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:code_rats_school/services/api_services.dart';
import 'package:code_rats_school/models/cursos_model.dart';
import 'package:code_rats_school/common/utils.dart';

class CursoDetailPage extends StatefulWidget {
  final int cursoId;
  const CursoDetailPage({super.key, required this.cursoId});

  @override
  State<CursoDetailPage> createState() => _CursoDetailPageState();
}

class _CursoDetailPageState extends State<CursoDetailPage> {
  ApiServices apiServices = ApiServices();

  late Future<Curso> curso;

  @override
  void initState() {
    fetchInitialData();
    super.initState();
  }

  fetchInitialData() {
    curso = apiServices.getCurso(widget.cursoId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Curso'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: curso,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final curso = snapshot.data;

              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Seção de imagem, título e descrição
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Imagem do pôster
                        Container(
                          width: 120,
                          height: 180,
                          child: CachedNetworkImage(
                            imageUrl: '$imageUrl${curso?.imgurl}.png',
                            placeholder: (context, url) =>
                                Image.asset('assets/placeholder.png'),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Título e descrição do filme
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                curso?.name ?? '',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Duracao: ${curso?.duration.toString()} horas',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Descrição do filme
                              Text(
                                curso?.description ?? '',
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Seção de partes do filme
                    const Text(
                      'Aulas',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Lista de partes do filme
                    Column(
                      children: [
                        _buildPartItem("Parte 1: Introdução"),
                        const SizedBox(height: 10),
                        _buildPartItem("Parte 2: Desenvolvimento"),
                        const SizedBox(height: 10),
                        _buildPartItem("Parte 3: Conclusão"),
                      ],
                    ),
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildPartItem(String partTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            partTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _showVideoDialog(partTitle);
            print("$partTitle pressionado!");
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Assistir agora',
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _showVideoDialog(String partTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SizedBox(
            width: 450,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Assistindo: $partTitle',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Aqui você pode colocar um widget de vídeo, como um VideoPlayer, ou um link
                // Para fins de exemplo, vou colocar um placeholder
                Container(
                  width: 250,
                  height: 100,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Vídeo aqui!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Fecha o pop-up
                  },
                  child: const Text('Fechar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
