import 'package:flutter/material.dart';

class DropDownButtonKullanimi extends StatefulWidget {
  const DropDownButtonKullanimi({super.key});

  @override
  State<DropDownButtonKullanimi> createState() => _DropDownButtonKullanimiState();
}

class _DropDownButtonKullanimiState extends State<DropDownButtonKullanimi> {
  String? _secilenSehir = null ;
  List<String> _tumSehirler = ["Yalova", "Adana" ,"Sasmsun" ,"Trabzon","Ankara"];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(                      // şecildiğinde value ye gelecek veri türünü belirtiyorum <String> ile.
        hint: const Text("Şehir Seciniz"),                // ilk gosterım 
        icon: const Icon(Icons.arrow_downward),           // kücük simgeyi degişmemi sağlar.
        iconSize: 32,                                     // ikon buyuklugunu değiştirir.
        underline: Container(                             // altaki küçük cizgiyi ayarlarım.
          height: 2, 
          color: Colors.purple,
        ),  
        style: const TextStyle(color: Colors.red),      // menunun işççindeki elemanları rengını yarladım.
        
        /*items: const [                                  //menunun içindeki elemanları belirtir. Ama  bu amele işi dogrusu altta
          DropdownMenuItem(
            child: Text("Bursa Şehri"),                  // nasıl gozukecegını belirtiyo.istersem fotoda koyabilirim.
            value: "Bursa",                              // secilirse bana gelecek deger
          ),
          DropdownMenuItem(
            child: Text("Ankara Şehri"),
            value: "Ankara", 
          ),
          DropdownMenuItem(
            child: Text("Yalova Şehri"),
            value: "Yalova",
          )
        ],*/                              
        items: _tumSehirler.map(                         //içinde string olan listeyi ; içinde dropdownıtem olan listeye cevirmek için map
          (String oankiSehir) => DropdownMenuItem(
          value:oankiSehir,
          child: Text(oankiSehir), 
          )
        ).toList(),                                      // .map ıterable donduruyo o yuzden .list ile listeye cevirdim.                                          
        
        value: _secilenSehir,                           // ekrana seçilen sehrı gosterır
        
        onChanged: (String? secilenValue) {
          setState(() {                                 
            _secilenSehir = secilenValue;               // seçimi yaptıktan sonra secımı ekranda gostermek için setState kullanmam laımkı value: _secilenSehir guncellensın
          });
          
        },
      ),
    );
  }
}