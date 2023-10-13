
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/ogrenci_detay.dart';
import 'package:flutter_navigations/ogrenci_listesi.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/purple_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/yellow_page.dart';

import 'main.dart';

class RouteGenerator{

  static Route<dynamic>? _routeOlustur(Widget gidilecekWidget, RouteSettings settings){     // platformlara gore navigoter ıslemını fonka cevırdım.
    if(defaultTargetPlatform == TargetPlatform.iOS){
          return CupertinoPageRoute(
            settings: settings,                                     //routeGeneratore gelen settıngsı buraya yollamma laızm cunku agaca route ekleme vb. olaylar burda
            builder: (context) => gidilecekWidget,                  // boylece artık verı sayfaya gıder sımdı onu karsılamk lazım
          );
        }
        else if(defaultTargetPlatform == TargetPlatform.android){
          return MaterialPageRoute(
            settings: settings,                                    // verileri kurucu metodlar ıle yollarsam buna gerek kalmaz.
            builder: (context) => gidilecekWidget, 
          );
        }
        else{
          return CupertinoPageRoute(
            settings: settings,
            builder: (context) => gidilecekWidget, 
          );
        }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings){   //onGenerateRoute un istediği yapıyı olusturdum burda. Ve mainde karşısına yazdım.
    switch(settings.name){
      case "/":
        return _routeOlustur(MyHomePage(), settings);

      case "/redPage":
        return _routeOlustur(RedPage(), settings);

      case "/orangePage":
        return _routeOlustur(OrangePage(), settings);

      case "/yellowPage":
        return _routeOlustur(YellowPage(), settings);

      case "/ogrenciListesi":
        debugPrint(settings.name);
        debugPrint(settings.arguments.toString());
        return _routeOlustur(OgrenciListesi(), settings);             // routeOlustura settingsi göndermem lazım.

      case "/ogrenciDetay":
        var gelenOgrenci = settings.arguments as Ogrenci;              // gelen obje turundekı verıyı Ogrencı turune donusturdum 
        return _routeOlustur(OgrenciDetay(secilenOgrenci: gelenOgrenci), settings);  // ogrenciDetay sınıfını kulandıgım gıbı secılıogrencı propertsısı geldıç

      case "/purplePage":
        return _routeOlustur(PurplePage(), settings);

      default:
        return MaterialPageRoute(builder: (context) => 
          Scaffold(
            appBar: AppBar(title: const Text("Error"),),
            body: const Center(child: Text("sayfa bulunamadi"),),
          ),
        );
    }
  }

}