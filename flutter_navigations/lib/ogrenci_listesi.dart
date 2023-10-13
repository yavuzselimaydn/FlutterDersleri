import 'package:flutter/material.dart';

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({super.key});

  @override
  Widget build(BuildContext context) {                                     // gelen verıyı context kullnacagımız için buuildın altında karsılamam lazım
    int gelenSayi = ModalRoute.of(context)!.settings.arguments as  int;    // gelen verı obje oldugu ıcın as ıle tur donusumu yaptım(cast).
    debugPrint("gelen eleman : $gelenSayi");
    
    List<Ogrenci> tumOgrenciler = List.generate(
      gelenSayi,
      (index) => Ogrenci(index+1, "İsim ${index+1}", "Soyisim : ${index+1}"),
    );

    return Scaffold(
      appBar: AppBar(title: const Text("Öğrenci Listesi")),
      body: ListView.builder(
        itemBuilder: (context, index) {
          var anlikOgrenci = tumOgrenciler[index];
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context,"/ogrenciDetay", arguments: anlikOgrenci);    // route generatore gıt
            },
            leading: CircleAvatar( child: Text("${anlikOgrenci.id}") ),
            title: Text(anlikOgrenci.isim),
            subtitle: Text(anlikOgrenci.soyisim),
          );
        },
        itemCount: gelenSayi,
      ),
    );
  }
}

class Ogrenci{
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
}