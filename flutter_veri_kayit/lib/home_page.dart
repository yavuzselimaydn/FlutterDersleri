import 'package:flutter/material.dart';
import 'package:flutter_veri_kayit/shared_prefence_kullanimi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("homepage"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=> SharedPrefenceKullanimi()  )
            );
          },
          child: const Text("shared prefence kullanımı"),
        ),
      ),
    );
  }
}
