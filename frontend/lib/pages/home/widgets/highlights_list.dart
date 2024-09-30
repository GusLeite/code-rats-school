import 'package:flutter/material.dart';
import 'package:code_rats_school/widgets/custom_card_thumbnail.dart';
import 'package:code_rats_school/pages/curso_detail/curso_detail_page.dart';
import 'package:code_rats_school/models/cursos_model.dart';

class HighlightList extends StatefulWidget {
  final Cursos cursos;
  const HighlightList({Key? key, required this.cursos}) : super(key: key);

  @override
  State<HighlightList> createState() => _HighlightListState();
}

class _HighlightListState extends State<HighlightList> {
  final PageController _pageController = PageController(viewportFraction: 1.0); // Alterado para 1.0
  int currentPage = 0;
  final int maxItems = 5;

  // Função para mover para a próxima página
  void _nextPage() {
    if (currentPage < (widget.cursos.cursos.length - 1)) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  // Função para mover para a página anterior
  void _previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final totalItems = widget.cursos.cursos.length;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45, // Altura ajustada para ocupar menos espaço
          child: Stack(
            children: [
              // Conteúdo do carrossel
              PageView.builder(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemCount: totalItems > maxItems ? maxItems : totalItems,
                itemBuilder: (context, index) {
                  final curso = widget.cursos.cursos[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0), // Adicionando padding lateral
                    child: Row(
                      children: [
                        // Imagem do filme
                        Expanded(
                          flex: 2,
                          child: CustomCardThumbnail(
                            imageAsset: curso.imgurl,
                          ),
                        ),
                        const SizedBox(width: 10), // Espaçamento entre imagem e texto
                        // Título, descrição e botão "Assistir agora" com posição fixa
                        Expanded(
                          flex: 3,
                          child: Stack(
                            children: [
                              // Título e descrição
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Título do filme
                                    Text(
                                      curso.name,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Descrição do filme
                                    Text(
                                      curso.description,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Botão "Assistir agora" com posição fixa na parte inferior direita
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: ElevatedButton(
                                  onPressed: () {
                                    print('Assistir agora pressionado!');
                                    Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CursoDetailPage(
                                          cursoId: curso.id,
                                        )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red, // Cor do botão
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text(
                                    'Assistir agora',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
              // Botão de navegação para a esquerda (anterior), movido para fora do conteúdo
              Positioned(
                left: 5, // Posição ajustada para ficar dentro da tela
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: _previousPage,
                  ),
                ),
              ),
              // Botão de navegação para a direita (próxima), movido para fora do conteúdo
              Positioned(
                right: 5, // Posição ajustada para ficar dentro da tela
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                    onPressed: _nextPage,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Indicadores de página
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildPageIndicators(),
        ),
      ],
    );
  }

  // Método para construir os indicadores de página
  List<Widget> _buildPageIndicators() {
    final totalItems = widget.cursos.cursos.length;
    final int indicatorCount = totalItems > maxItems ? maxItems : totalItems;

    List<Widget> indicators = [];
    for (int i = 0; i < indicatorCount; i++) {
      indicators.add(
        i == currentPage ? _buildIndicator(true) : _buildIndicator(false),
      );
    }
    return indicators;
  }

  // Construtor do indicador (ativo ou inativo)
  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: isActive ? 12.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
