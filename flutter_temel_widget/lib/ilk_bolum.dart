import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());                                  // runaapp den 3 tane var, material olanı seç.
}

class MyApp extends StatelessWidget{
  final String img1 = "https://scontent.fyei1-1.fna.fbcdn.net/v/t1.6435-9/133567465_3632177570194742_7699602424621315328_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=e3f864&_nc_ohc=6W9AdK_Lv1MAX-h0pUR&_nc_ht=scontent.fyei1-1.fna&oh=00_AfBhNqKO5z-uTaZyi_gBDZsQIAYWAj44MeV3SA96JWC8dQ&oe=649D67E7";
  final String img2 = "https://t4.ftcdn.net/jpg/05/08/54/85/360_F_508548552_fHAB3kvUoxxSAe2g0RYTaVKlfS5sOEqh.jpg";
  
  Container containerOlustur(String harf, Color renk, {double margin = 0}){
    return Container(
      margin : EdgeInsets.only(top: margin), 
      height: 75,
      width: 75,
      color: renk,
      alignment: Alignment.center,
      child: Text(harf, style: TextStyle(fontSize: 48),),
    );
  }

  Row rowOlustur() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        containerOlustur("D", Colors.orange.shade100),
        containerOlustur("E", Colors.orange.shade300),
        containerOlustur("R", Colors.orange.shade500),
        containerOlustur("S", Colors.orange.shade700),
      ],
    );
   }

  Column columnOlustur() {
      List<String> dizi = ["E","R","S","L","E","R","İ"];
      List<Widget> dizi2 = [];
      for(int i = 0; i<dizi.length; i++){
        dizi2.add(Expanded(child: containerOlustur(dizi[i], Colors.orange.shade100, margin : 15)));
      }

      return Column(
        children: [...dizi2],
      );
    }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                                        // en genel iskeleti belirtir. bu ikisi her uygulamada olur -> material app ve scaffold
      theme: ThemeData(                                        // varsayılan tema burdan material appden degiştir.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue                         // ana tema rengini değiştim, copywith ile küçük şeylerin rengi
          ).copyWith(secondary: Colors.yellow)
      ),

      home: Scaffold(                                          // home ile başlangıc widgetini belirtiyorum.
        //backgroundColor: Colors.yellow,
        appBar: AppBar(
          title:const Text('Flutter Dersleri'),
          ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              rowOlustur(),
              Expanded(child: columnOlustur()),
            ]
          ),
        ),
        floatingActionButton: FloatingActionButton(          // etkileşimli buton
          onPressed: () {                                    // butona basıldıgında çalışan fonk
            debugPrint("Tiklandi");
           },
          backgroundColor: Colors.blue,                    // butonun arka plan rengi
          child: const Icon(Icons.keyboard_arrow_up),        // widgetın içine koyacağım elemanı belirtir  ->child
           ),
      ),
    );
  }



  List<Widget> get sorunluContainer {
    return <Widget>[
            Container(
              width: 100,
              height: 75,
              color: Colors.red
            ),
            Container(
              width: 100,
              height: 75,
              color: Colors.yellow
              ),
            Container(
              width: 100,
              height: 75,
              color: Colors.black,
            ),
            Container(
              width: 100,
              height: 75,
              color: Colors.grey,
            ),
            Container(
              width: 100,
              height: 75,
              color: Colors.blue,
            ),
          ];
  }

   List<Widget> get expandedContainer {                     // expanded da widgetler birbirni oranlar ve tum bosluga yayılır.
    return <Widget>[
            Expanded(
              flex:1,
              child: Container(
                width: 150,
                height: 75,
                color: Colors.red
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: 150,
                height: 75,
                color: Colors.yellow
                ),
            ),
            Expanded(
              flex:2,
              child: Container(
                width: 150,
                height: 75,
                color: Colors.black,
              ),
            ),
            Expanded(
              flex:1,
              child: Container(
                width: 150,
                height: 75,
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex:1,
              child: Container(
                width: 150,
                height: 75,
                color: Colors.blue,
              ),
            ),
          ];
  }

   List<Widget> get flexibleContainer {                    // içerik kadra buyur lazımsa kuculur.
    return <Widget>[
            Flexible( 
              child: Container(
                width: 200,
                height: 200,
                color: Colors.red
              ),
            ),
            Flexible(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.yellow
                ),
            ),
            Flexible(
              child: Container(
                width: 100,
                height: 200,
                color: Colors.black,
              ),
            ),
            Flexible(
              child: Container(
                width: 300,
                height: 200,
                color: Colors.grey,
              ),
            ),
          ];
  }
  
  Widget containerDersleri() {
    return Center(
        child:  Container(
          width: 400,
          height: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.rectangle,
            border: Border.all(width: 5, color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image:  NetworkImage(img2) , 
              fit: BoxFit.fill,
              repeat: ImageRepeat.repeat,
              ),
            boxShadow: const [
              BoxShadow(
                color: Colors.red,
                offset: Offset(0, 20),
                blurRadius: 10   
              ),
              BoxShadow(
                color: Colors.yellow,
                offset: Offset(0, -20),
                blurRadius: 10
              ),
            ],
          ),
          alignment:Alignment.bottomRight,
          child:const Text(
            "-Yaparsa AK Parti yapar.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            )),
        ),
      );
  }
  
 

}