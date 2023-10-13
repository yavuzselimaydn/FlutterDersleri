import 'package:flutter/material.dart';
import 'package:flutter_dersleri_bolum2/models/veri.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa(Key? k) : super(key: k); // gelen keyı ust sınıfına yolladım statefıl sınıfına

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}


class _AnasayfaState extends State<Anasayfa> {
  late List<Veri> tumVeriler;

  @override
  void initState() {
    super.initState();
    tumVeriler = [
      Veri("Biz Kımiz", "Biz kimizin icerigi", false),
      Veri("Misyonumuz", "Misyonun icerigi", false),
      Veri("Visyonumuz", "Visyonun icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
      Veri("Biz Kımiz", "kimizin icerigi", false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tumVeriler.length,
      itemBuilder: (context, index) {
        return ExpansionTile(     //List tile benzeri ama daha degısıkı tıklayınca ek alan sınar
          key: PageStorageKey("$index"), //alan bılgısi tutıldıgı ıcın her bır ogeyı ayıt etmek ıvınc hepsıne key olusturdugu
          title: Text(tumVeriler[index].title),
          initiallyExpanded: tumVeriler[index].alanAcikmiKapalimi,// sayfa acıldıgınfda alan acık mu olsın kapalı mı
          children: [
            Container(
              color: index % 2 == 0 ? Colors.red.shade200 : Colors.purple.shade200,
              height: 100,
              width: double.infinity,
              child: Center(child: Text(tumVeriler[index].icerik)),
            )
          ],
        );
      },
    );
  }
}
