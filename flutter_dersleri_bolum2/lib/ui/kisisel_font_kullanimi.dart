import 'package:flutter/material.dart';

class KisiselFont extends StatelessWidget {
  const KisiselFont({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Kişisel Font Kullanımı",
              style: TextStyle(
                  fontFamily: "ElYazisi",//pubspec de tanımladıgm isim
                  fontSize: 24), //font familye ismi girdim
            ),
            Text(
              "Genel Font Kullanımı",
              style: TextStyle(
                  fontFamily: "Genel", fontSize: 24), //font familye ismi girdim
            ),
          ]);
  }
}