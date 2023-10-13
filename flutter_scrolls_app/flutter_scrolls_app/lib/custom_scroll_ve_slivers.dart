import 'dart:math';

import 'package:flutter/material.dart';

class CollapsableToolbarOrnke extends StatelessWidget {
  const CollapsableToolbarOrnke({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: AppBar(title: const Text("ders"),),   ==>  alta sliver appbar kullandım dıye bunu ıptal ettım.
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //title:const Text("Custom Scroll", style: TextStyle(color: Colors.black),),  ==> alta kullnasdım o yuzden ıptal.
            backgroundColor: Colors.red,
            expandedHeight: 200,               // appbaar tamamen acıkken kaplıcagı yer.
            floating: false,                   // false olursa appar en basa donunce geri gelir. True oldugunda ise en alta iken yukarı harektte appbar gelir.          
            pinned: true,                    // true durumunda en aşagı ındıgımızde appbar kucuk bir şekilde gozukur.
            snap: false,                       //floting ,pinid,snap ile oynayarak guzel tasarımlar oluşabilir. 
            flexibleSpace: FlexibleSpaceBar(
              title:const  Text("Sliver App Bar",style: TextStyle(color: Colors.black),),
              centerTitle: true,               // baslıgı ortalar.
              background: Image.network(
                "https://thurrott.s3.amazonaws.com/2019/05/flutter-mobile-web-desktop.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),

          //sabit elemanlar ile bir satırda kac eleman olacagını soyledıgımız grid turu
          SliverGrid(
            delegate: SliverChildListDelegate(sabitListeElemanlar()),                          //elemanları belirtir
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),  // grid in çalışma mantıgını
          ),

          // dinamik elemnalar ile saturda kac eleman oldugunu soyledıgım grid turu
          SliverGrid(
            delegate: SliverChildBuilderDelegate(dinamikElemanliListe,childCount: 6), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)
          ),

          //dinamik elemanlar ile satırdaki elemanın buyuklugunu belirttiğin grid turu
          SliverGrid(
            delegate: SliverChildBuilderDelegate(dinamikElemanliListe,childCount: 6), 
            gridDelegate:const  SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300)
          ),

          //sliverGridin  isilendirilmiş constructorları
          SliverGrid.count(                 
            crossAxisCount: 6,
            children: sabitListeElemanlar()           //dinamik liste kullanılmaz.
          ),

          SliverGrid.extent(
            maxCrossAxisExtent: 400,
            children: sabitListeElemanlar(),          //dinamik liste kullanılmaz.
          ),

          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemBuilder: dinamikElemanliListe,        //dinamik liste kullanılır.
            itemCount: 6,
          ),


          //statik elemanlı bir sliver list view
          SliverPadding(                              //custom scrool bizden sadece sliver widgetları ıstedıgı ıcın slıverpaddıng kullandım.
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(                        //sliverı child gıbı dusun
              delegate: SliverChildListDelegate(      
                sabitListeElemanlar()                 // children normal parametre olduğu için direk listeyi yazdım.
              ),
            ),
          ),

          //elemanları builder ile olusturulan list view
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                dinamikElemanliListe, 
                childCount: 6,                        // olusacak eleman sayısı
              )
            ),
          ),
        
          //elemanları statik olusturulan ama extent mantıgıyla calısan list view
          SliverFixedExtentList(                    // sliverList den daha performanslı
            delegate: SliverChildListDelegate(      
              sabitListeElemanlar()                 
            ), 
            itemExtent: 200                          // oluşacak elemanların yuksekliği
          ),

          //elemanları dinamik olusturulan ama extent mantıgıyla calısan list view
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate(
              dinamikElemanliListe,
              childCount: 6
            ),
            itemExtent: 50,
          )
        ],
      ) ,
    );
  }

  List<Widget>  sabitListeElemanlar() {
    return [
              Container(
                color: Colors.blue,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 1",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                color: Colors.purple,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 2",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                color: Colors.green,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 3",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                color: Colors.orange,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 4",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                color: Colors.pink,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 5",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                color: Colors.yellow,
                alignment: Alignment.center,
                height: 100, 
                child:const Text(
                  "Sabit liste elemaan 6",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ];
  }
  
  Widget dinamikElemanliListe(context, index) {
    return Container(
      color: farkliRenkUret(),
      alignment: Alignment.center,
      height: 100, 
      child: Text(
        "Dinamik liste elemani ${index + 1}",
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
  
  Color farkliRenkUret() {
    return Color.fromARGB(
      Random().nextInt(255), 
      Random().nextInt(255), 
      Random().nextInt(255), 
      Random().nextInt(255),
    );
  }
}