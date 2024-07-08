import 'package:flutter/material.dart';
import 'package:translator_app/language_translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Language Translator App',
      debugShowCheckedModeBanner: false,
      home:languageTranslator()
    );
  }
}
