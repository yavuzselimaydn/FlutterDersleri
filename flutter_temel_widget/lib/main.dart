import 'package:flutter/material.dart';
import 'package:flutter_temel_widget/popupmenu_kullanimi.dart';

void main(){
  debugPrint("main metodu calisti.");              // hot reload da sadece build metodları çalışır. Hot restart da ise kodlar en baştan mainden çalışır.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {              // 'statelessW' kod sablonu ile bunu otomatik oluturdum.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {             //widgetın nereye build edilmesini gerektiğini söyler. Ve veri taşıma işlemlerinde kullnaılır.
    debugPrint("MyApp build metodu calisti.");
    return MaterialApp(                            // tüm uygulamayı belirtir.
      title: "My Counter App",                     // uygulamayı arka plana aldıgımızda gozugecek ısım
      debugShowCheckedModeBanner: false,           // appbar üzerindeki bannerı kaldırır.
      theme: ThemeData(
        primarySwatch: Colors.purple,
        outlinedButtonTheme: OutlinedButtonThemeData(style : OutlinedButton.styleFrom()),   // uygulamadaki tum outlined buttonların rengini burdanda ayarlayabılırım.
        textTheme : const TextTheme(
          headline1 : TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.w100
          )),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Buton Örnekleri"),
          actions: const [PopupMenuKullanimi()],             // popupmenu appbara ekledım
        ),
        body:const PopupMenuKullanimi(),                     // uygulamanın ilk açılış sayfasını belirtir.
      ),
    );
  }
}


