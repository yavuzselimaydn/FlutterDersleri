import 'package:flutter/material.dart';

class TemelButonlar extends StatelessWidget {
  const TemelButonlar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          onLongPress: () {                                               // butona uzun basılınca çalışır.
            debugPrint("Uzun Basıldi.");
          },
          child: const Text("Text Button")
        ),
        TextButton.icon(
          onPressed: () {}, 
          icon: const Icon(Icons.add), 
          label: const Text("Text Button with Icon"),
          style: ButtonStyle(
            //backgroundColor: MaterialStateProperty.all(Colors.red),     // butonun arka plan rengini değişti. & .all tumdurumları tesmil eder yani basılınca ,uzun basılınca vb.
            backgroundColor: MaterialStateProperty.resolveWith(           // Butonun durumlarına gore ayrı ayrı background ayarlıcam.
              (states) {
                if(states.contains(MaterialState.pressed)){               // butona basıldıgında arka plan rengi
                  return Colors.teal;
                }
                if(states.contains(MaterialState.hovered)){               // butonun ustune gelindiğinde arka plann rengi
                  return Colors.blue.shade200;  
                }
                return null;                                              //  hiçbiri gercekleşmez ise ana tema rengi
              }),
            foregroundColor: MaterialStateProperty.all(Colors.yellow),  // Yazının ve ıconun rengini değişti.
            overlayColor: MaterialStateProperty.all(Colors.yellow.withOpacity(0.4))  // basınca oluşan efekti ayarlar.
          ),
        ),
        ElevatedButton(
          onPressed: () {}, 
          child: const Text("Elevated Button"),
          style: ElevatedButton.styleFrom(                                          // eger butonun durumunda bagımsız ayarlamakk istiyosan bunu kullaln.
            primary: Colors.blue.shade100,                                        // butona arka plan rengini değiştirir.
            onPrimary: Colors.green,                                              // yazının rengini ve basılınca olusan efekti
          ), 
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Elevated Button with Icon")
        ),
        OutlinedButton(                                                             // main darta ayarladım renglerini.
          onPressed: () {}, 
          child: const Text("Outlined Button")
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Outlined Button with Icon"),
          style : OutlinedButton.styleFrom(
            shape: StadiumBorder(),                                                // butonun kenarlarını ovalleştirdi.
            side: BorderSide(color: Colors.red, width: 5)                        // butonun kenarlarını rengını aarladı.
          )
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text("Outlined Button with Icon"),
          style : OutlinedButton.styleFrom(
            side: const BorderSide(color : Colors.purple, width: 5),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(48))                // butonun kenarlarını kendime gore ovalleştirdi.
            ),
          )
        )
      ],
    );
  }
}
