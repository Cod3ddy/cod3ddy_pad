import 'package:cod3ddy_pad/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(246, 185, 15, 1),
          selectionColor: Color.fromRGBO(246, 185, 15, 1),
          selectionHandleColor: Color.fromRGBO(246, 185, 15, 1),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(247, 247, 247, 1),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
