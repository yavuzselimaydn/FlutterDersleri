import 'package:flutter/material.dart';

class PopupMenuKullanimi extends StatefulWidget {
  const PopupMenuKullanimi({super.key});

  @override
  State<PopupMenuKullanimi> createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<PopupMenuKullanimi> {
  
  String seciliSehir = "sehır";
  List<String> sehirler = ["samsun", "yalova","istanbul"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton(                              //appbara ekledım main darta

        onSelected: (String oankiDeger) {                  // secildiginde calısacak olan fonk
          setState(() {
            print("secili deger : $oankiDeger");
            seciliSehir = oankiDeger;
          });
        },

        //icon: Icon(Icons.add),                             // 3 nokta ıconunu degiştirir.

        //child: Text(_seciliSehir),

        itemBuilder: (BuildContext context) {              // tıklandıgında acılan elemanları olusturur.
        /*return const <PopupMenuEntry<String>>[
          PopupMenuItem(
            value: "Yalova",
            child: Text("Yalova"), 
          ),
          PopupMenuItem(
            value: "Ankara",
            child: Text("Ankara"), 
          ),
          PopupMenuItem(
            value: "Samsun",
            child: Text("Samsun"), 
          ),
        ];*/
          return sehirler.map(
            (String sehir) => PopupMenuItem(
              value: sehir,
              child: Text(sehir),
            )
          ).toList();
      }),
    );
  }
}
