import 'package:flutter/material.dart';
import 'package:code_rats_school/pages/home/home_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _tabs = [
            HomePage(),
            HomePage(), //perfil
            HomePage(), //cursos salvos
            HomePage(), //buscar
          ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: TabBarView(
          children: _tabs,
        ),
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.account_circle), text: 'Perfil'),
            Tab(icon: Icon(Icons.bookmark_border), text: 'Cursos Salvos'),
            Tab(icon: Icon(Icons.search), text: 'Search'),
            ]
          ),
        ),
      ),
    );
  }
}
