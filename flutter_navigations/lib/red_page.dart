import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RedPage extends StatelessWidget {
  RedPage({super.key});
  int _rastgeleSayi = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(                              // donanımsal olarak olan geri tuşlarını kontrol etmemı saglar.
      onWillPop: () {
        debugPrint("on will pop calısti"); 
        _rastgeleSayi =Random().nextInt(100);
        Navigator.pop(context, _rastgeleSayi);         // iptal ettıgım tusları bu kodla gerı donmesını saglıyorum.

        return Future.value(false);                    // telefonda olan gerı tusları ıptal ettım.
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Red Page"), 
          backgroundColor: Colors.red,
          //automaticallyImplyLeading: false,           // appbarda oluşan otomatik gerituşunu kaldırdım.
        ),
        body:  Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Red Page", 
                style: TextStyle(fontSize: 24),
              ),
    
              ElevatedButton(
                onPressed: () {
                  _rastgeleSayi = Random().nextInt(100);
                  debugPrint("üretilen sayi : $_rastgeleSayi");
                  Navigator.of(context).pop(_rastgeleSayi);   // pop ile donulen sayfaya deger gonderebılıyorum. Onu push metodunda karsılamm lazım
                  //Navigator.pop(context);  ==> push ile yeni eleman eklenir, pop ile en son eklenen eleman çıkarılır.
                }, 
                child:const  Text("Geri Dön")
              ),

              ElevatedButton(
                onPressed: () {
                  if(Navigator.of(context).canPop()) {    // Geriye donebilirmiyim donezmıyım dıye ture false dondurur.Yani öncesinde sayfa varmı dıye sorgular
                    print("pop olur");
                  }else {
                    print("pop olmaz");
                  }
                },   
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
                child: const Text("Can Pop Kullanimi"),
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/orangePage");
                },   
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                child: const Text("Go to Orange"),
              ),
            ],
          ),
        ),
      )
    );
  }
}