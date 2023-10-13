import 'package:flutter/material.dart';
import 'package:flutter_dersleri_bolum2/ui/ana_sayfa.dart';
import 'package:flutter_dersleri_bolum2/ui/bul_sayfa.dart';
import 'package:flutter_dersleri_bolum2/ui/drawer_menu.dart';
import 'package:flutter_dersleri_bolum2/ui/page_view.dart';
import 'package:flutter_dersleri_bolum2/ui/tabs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int secilenMenuItemIndex = 0;

  var keyAnaSayfa = const PageStorageKey("keyAnaSayfa");  //sayfaların ana durumunu tutuyor yanı scrolun nerde durduugunu
  var keyArama = const PageStorageKey("keyArama");

  late List<Widget> tumSayfalar ;
  @override
  void initState() {
    super.initState();
    tumSayfalar =  [         //sayfaları eklkedım ve olusturdum
      Anasayfa(keyAnaSayfa), // olusturdugum keylerı sayfalara yollsdım
      Bulsayfa(keyArama),
      const PageViewOrnek()
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),       //ayrı bir widget olarak olusturdum
      appBar: AppBar(
        title: const Text("Flutter Dersleri"),
      ),
      body: tumSayfalar[secilenMenuItemIndex],  //sayfaslar arsası gecisi saglsdım
      bottomNavigationBar: bottomNavBar(),    //daha kolay ve işime yarar diye boyle fonk
    );
  }


  Theme bottomNavBar () {
    return Theme(                      //bottom navigation bar scaffollda tanımlanır
        data: ThemeData(               //fixed iken arka plan rengini deistirmek iciiiin theme ile sardım
          canvasColor: Colors.cyan,
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Anasayfa",
                backgroundColor: Colors.amber
              ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                activeIcon: Icon(Icons.call),
                label: "Ara",
                backgroundColor: Colors.red
              ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Ekle",
                backgroundColor: Colors.orange
              ),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                label: "Profil",
                backgroundColor: Colors.cyan
             ),
          ],                                        //fixed de ise canvas colordsa n filan gelit
          type: BottomNavigationBarType.fixed,     // items 4 den fazla ise shiftinge gecer. Shiftingde itemlara verdıgım renkler olur.
          currentIndex: secilenMenuItemIndex, 
          fixedColor: Colors.red,                //secili olanın rengi
          onTap: (index) {
            setState(() {
              secilenMenuItemIndex = index;
              if(index == 3){
                secilenMenuItemIndex = 2;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TabOrnek() //yeni bir sayfa actım
                  )
                ).then(
                  (value) {secilenMenuItemIndex = 0;}
                 );
              }
            });
          },
        ),
      );
  }
}