import 'package:flutter/material.dart';
import 'package:code_rats_school/common/utils.dart';
import 'package:code_rats_school/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavBar(),
      title: 'Code Rats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: kBackgoundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBackgoundColor,
          ),
      ),
    );
  }
}
