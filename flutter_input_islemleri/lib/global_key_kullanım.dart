import 'package:flutter/material.dart';

class GlobalKeyKullanim extends StatelessWidget {
  GlobalKeyKullanim({super.key});                           //keyler olusturdugumuz widgetları tanımlayan benzersız anahtarlardır.
  final sayacWidgetKey = GlobalKey<_SayacWidgetState>();    //bu key ile hem olusturdugum widgeta veya statene erısbılırım.
                                                            
  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(title: const Text("Global Key Kullanım"),),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("basılma miktarı:"),
            SayacWidget(key: sayacWidgetKey)              // widgeta ozel olusturdugum key ı ona tanıttım                    
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          sayacWidgetKey.currentState!                      // sayac widgetın statine(verisine) erıstım
            .arttir();                                      // ordan fonka erıstım
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SayacWidget extends StatefulWidget {           // global key ile widgeta erısceksem o widgetın  private hıcbrı degıskenı olmamalı
  const SayacWidget({super.key});

  @override
  State<SayacWidget> createState() => _SayacWidgetState();
}

class _SayacWidgetState extends State<SayacWidget> {             //performans acısından uygulamayı widgetlara bol
  int _sayac = 0;
  
  void arttir(){
    setState(() {
      _sayac++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    print("2");
    return Text(
      _sayac.toString(), 
      style: Theme.of(context).textTheme.headline1,
    );
  }
}