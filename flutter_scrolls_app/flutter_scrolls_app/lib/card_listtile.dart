import 'package:flutter/material.dart';

class CardveListtileKullanimi extends StatelessWidget {
  const CardveListtileKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Card ve List tile"),),
      body:  Center(
        child: ListView(                     // singleChildview dan farkı listview children alır. Yaptıkları iş aynı scroollozelliği veriri bana.
          reverse: true,                                          // elemanları sondan baslayrak yazar.
          children : [                                            // list view ve singlechild performans dostu değillerdir.
            Column(                                               // her bir eleman ekranda gozukmese bile bellekte yer kaplar.
            children: [
              tekListeElamani(),                                   
              tekListeElamani(),
              tekListeElamani(),
              tekListeElamani(),
              tekListeElamani(),
              tekListeElamani(),
              tekListeElamani(), 
              tekListeElamani(),
              tekListeElamani(),
              tekListeElamani(),
            ],
          ),
           const Text("MERHABA"),
          ElevatedButton(onPressed: () {}, child: const Text("Buton"))
        ]
        ),
      ),
    );
  }

  SingleChildScrollView singleChildKullanimi() {
    return SingleChildScrollView(                 // belirli tasarımım varsa ve ekrana sıgar mı sıgmaz mı dıye dusunuyorsam ilk aklıma bu gelmeli
        child: Column(
          children: [
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
            tekListeElamani(),
          ],
        ),
      );
  }

  Column tekListeElamani() {                                         // cardı ve divider tek bır elemanmış gibi düşün
    return Column(
        children: [
          Card(                                                      // kart görünümü verir.
            color: Colors.blue.shade100,
            shadowColor: Colors.red,
            elevation: 6,                                            // shadow colorı belirginleştirir.
            shape: RoundedRectangleBorder(                           // kartın kenarlarını ovallestırdım.
              borderRadius: BorderRadius.circular(15)
            ),
            child: const ListTile(                                   // Cardı özelleştirmemi sağlar.             
              leading: CircleAvatar(child: Icon(Icons.add)),         // kartın sol baş kısmı
              title: Text("Başlık"),                                  
              subtitle: Text("Alt Başlık"),
              trailing: Icon(Icons.real_estate_agent),               // kartın sag bas kısmı
            )
          ),
           Divider(                                              // bölücü ,iki elemanın arasını bolen ince bir çizgi
            color: Colors.red.shade200,                        // çizginin rengi
            thickness: 3,                                        // çizginin kalınlığı
            height: 15,                                          // ustundeki elemandan ne kadr uzak olsun
            indent: 30,                                          // soldan kısalığı
            endIndent: 30,                                       // sağdan kısalığı
          )
        ],
      );
  }
}