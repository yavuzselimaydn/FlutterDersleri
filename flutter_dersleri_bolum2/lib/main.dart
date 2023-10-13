import 'package:flutter/material.dart';
import 'package:flutter_dersleri_bolum2/ui/my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: MyHomePage());
  }
}


