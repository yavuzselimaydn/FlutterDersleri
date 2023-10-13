import 'package:flutter/material.dart';
import 'package:flutter_navigations/ogrenci_listesi.dart';

class OgrenciDetay extends StatelessWidget {
  final Ogrenci secilenOgrenci;
  const OgrenciDetay({ required this.secilenOgrenci, super.key});  // sınıf olusturdugunda verıyı deger olarak gecmek ıcın constu boyle tanımladım

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ogrenci detay"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(secilenOgrenci.id.toString()),
            Text(secilenOgrenci.isim),
            Text(secilenOgrenci.soyisim)
          ],
        )
      ),
    );
  }
}