import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/green_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {              // bu context kökü içerir. Yani bir ust yapıyı gossteoro.
    return const MaterialApp(                       // her material olusturdugumuzda arkada navıgoter sınıfı olusur.
      title: 'Material App',
      debugShowCheckedModeBanner: false,

      onGenerateRoute: RouteGenerator.routeGenerator,    // isimlendirilmiş rota (pushnamed vb.) kullandıgımda tetıklenır.
    );
  }
}

void kolayRouteIslemleri(){
  /*
  home: _MyHomePage(), ==> alta belirtigim için hata vermezsın dıye ıptal
  routes: {                                     // kullancagım rotaları tanımlıyorum.
        "/redPage" :(context) => RedPage(),         
        "/" :(context) => _MyHomePage(),            // ana sayfayı yanı acılıs sayfasını belırttım.
        "/orangePage":(context) => OrangePage(),    // buradakı context orange aıt
      },
      onUnknownRoute: (settings) => MaterialPageRoute(  // yanı bu fonk rotalar ıcınde olmayan bı rota gelır ıse burası calısır.
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text("Error"),),
          body: Center(child: Text("sayfa bulunamadi"),),
        ) 
      ),
  */
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override                                   // her build metodu ile beraber bana context değerı verır.
  Widget build(BuildContext context) {        // buradaki context myapp ve kökü gösterir. Ve bu context ile myapde materialappde tanımlanan navıgator sınıfına erısırım.
    return Scaffold(                      
        appBar: AppBar(
          title: const Text('Navigation İşlemleri'),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {                                  // burada gonderılen sayıyı .then ile karsıladım.
                  Navigator.push<int>(                           // pushtan hemen sonra gelecek sonucun turunu belirtebilirm.
                    context,                                     // bu context yukarıdakı build metoduna gelen contextır.
                    CupertinoPageRoute(                          // ios sayfa acılma efekti stılı
                      builder: (redcontext) =>RedPage()          // bu context ıse RedPage ın agaca eklendıgınde olusan yenı contextı
                    )
                  ).then((value) => debugPrint("gonderilen sayi2 :  $value"));
                  
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade100),
                child: const Text("Kirmizi sayfaya git IOS")
              ),
              
              ElevatedButton(
                onPressed: () async {                                            //burada gonderilen saayıyı await ile karşıladım.     
                  int? gelenSayi = await Navigator.of(context).push<int>(        // navigator sınıfı içinde rotaların tutuldugu yığın(stack) yapısıdır.
                    MaterialPageRoute(                              //.of ile yukarıdalarda olusturulan navigator sınıfına erıs ve ona yenı bır page route ekle dıyorum.
                      builder: (redcontext) =>  RedPage()
                    )
                  );  
                  debugPrint("gonderilen sayi $gelenSayi");     
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade200),
                child: const Text("Kirmizi sayfaya git Android")
              ),

              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();    // yıgınına bakar öncesinde bir eleman varsa elemanı cıkarır yoksa cıkarmaz.Burada pop kullanırsam koke gıder
                },   
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade300),
                child: const Text("Maybe Pop Kullanimi"),
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
                onPressed: () {       // logın sayfasından sonra anasayfaya bu fonk ıle gecırtırım. Yanı basarılı gırıste logıne donemez.
                  Navigator.of(context).pushReplacement(   // push ile benzer.GreenPageı ana sayfanın yerıne koyar.Yanı kullandıgımda stackte tek green page olur.
                    MaterialPageRoute(
                      builder: ((context) => GreenPage())
                    )
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
                child: const Text("Push Replacament Kullanimi"),
              ),

              const Text("Buradan sonrası onGenerateRoute ile çalışır."),

              ElevatedButton(
                onPressed: () {
                    //Navigator.of(context).pushNamed("/redPage");
                    Navigator.pushNamed(context, "/redPage");     // isimlendırmıs rota kullanımı .Buda default olarak materıalpage kullandı ama ıos ıcın yeterlı deıl.
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade400),
                child: const Text("PushNamed Red Kullanimi"),
              ),

              ElevatedButton(
                onPressed: () {;
                    Navigator.pushNamed(context, "/redPage2");    //olmayan rota gırılırse unKnowRoutes calısır.
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade100),
                child: const Text("Olmayan Rota"),
              ),

              ElevatedButton(
                onPressed: () {;
                    Navigator.pushNamed(context, "/orangePage");    
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade400),
                child: const Text("PushNamed Orange Rota"),
              ),

              ElevatedButton(
                onPressed: () {     
                  Navigator.pushNamed(                     // buradan routewGenenaratore gider
                    context, "/ogrenciListesi",           // router generaterdaki switch yapisina eklemam lazım bu yolu
                    arguments: 100                      // arguments ile veri yollarım  gidilecek  sayfaya
                  );     
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade400),
                child: const Text("Liste Oluştur"),
              ),

              ElevatedButton(
                onPressed: () {     
                  Navigator.pushNamed(                     
                    context, "/purplePage",           
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade400),
                child: const Text("Mor Sayfaya Git"),
              ),

            ],
          )
        ),
      );
  }
}
