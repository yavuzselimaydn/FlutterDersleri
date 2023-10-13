import 'package:flutter/material.dart';

class ListviewLayoutProblemleri extends StatelessWidget {
  const ListviewLayoutProblemleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview  Layout Problems"),
      ),
      body: Container(
        height: 200,
        decoration:
            BoxDecoration(border: Border.all(width: 4, color: Colors.red)),
        child: Row(
          children: [
            const Text("başladi"),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,                           // liste yatay olarak çalıır.
                //shrinkWrap: true,                                         // çocukları kadar yer tut diyom
                children: [
                  Container(
                    width: 100,
                    color: Colors.orange.shade100,
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange.shade300,
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange.shade500,
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange.shade700,
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    width: 100,
                    color: Colors.orange.shade300,
                  ),
                ],
              ),
            ),
            const Text("bitti")
          ],
        ),
      ),
    );
  }

  Column columnicindeListe() {
    return Column(                   //column cocuklarının yuksekliğini bbilmek zorında, Listview da yukseklığı bellı olmadığı cın hata verıyor.                        
      children: [
        const Text("Başladi"),
        Expanded(                                  // column içine alınca oluşan hatayı exapnded ile çöz. Yani textlerden kalan butun bosluga view yayılır.
          child: ListView(
            //shrinkWrap: true,                    // true ise cocuklarının yuksekliği kadar yer kaplar. false ise container yeri kadar yer kaplar.
            children: [
              Container(
                height: 200,
                color: Colors.orange.shade100,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade300,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade500,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade700,
              ),
            ],
          ),
        ),
        const Text("Bitti"),
      ],
    );
  }
}
