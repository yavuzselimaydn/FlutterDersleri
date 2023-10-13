import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json_api/model/araba_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({super.key});

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {

  String _title = "Local json islemleri";

  late final Future<List<Araba>> _listeyiDoldur;

  @override
  void initState() {
    super.initState();
    _listeyiDoldur = arabalarJsonOku();  //build tetiklendiginde fonkda tetilklenmesin diye init statede tası fonku
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: FutureBuilder<List<Araba>>(
        initialData: [      // veri internetten gelene kadar gosterecegim veriyi girereim buraaya
          Araba(
            arabaAdi: "honda", 
            ulke: "Tr", 
            kurulusYili: 1920, 
            model: [
                Model(modelAdi: "aaa", fiyat: 1000, benzinli: false)
              ]
            )
          ],
        future: _listeyiDoldur,       
        builder: (context, snapshot) {   
          
          if (snapshot.hasData)      // veri sorunsuz geldiyse
          {    
            List<Araba> tumArabalar = snapshot.data!;
            return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: tumArabalar.length,
                itemBuilder: (context, index) {
                  var oAnkiAraba = tumArabalar[index];
                  return ListTile(
                    title: Text(oAnkiAraba.arabaAdi),
                    subtitle: Text(oAnkiAraba.ulke),
                    leading: CircleAvatar(
                      child: Text(oAnkiAraba.model.length.toString()),
                    ),
                  );
                });
          } 
          
          else if (snapshot.hasError)   //hata geldiyse
          {   
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } 
          
          else                       //veri gelne kadar gecen surede
          {                        
            return const Center(child: CircularProgressIndicator());
          }

        },
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState(() {
            _title = "butona tıklandı"; // setstate de build tekrar tekrar calıştıgından arabalarJsonOkuda calısıyor ,performasn kaaybı
          });
      }),
    );
  }




  Future<List<Araba>> arabalarJsonOku() async {        //async kullandıgım icin list<araba> koyamadım
    try                                                 //future la calisiyorsan try olmali
    { 
      String okunanString = await DefaultAssetBundle.of(context).
      loadString("assets/data/arabalar.json");         //dosyayı bana striing olarak verır. Bu stringi json a cevirmem lazım

      var jsonObject = jsonDecode(okunanString);          //verdigi stringi jsona cevirdim

      List<Araba> tumArabalar = (jsonObject as List)     //veri turuu dynamic oldugu icin list cevirdim
          .map(
                (arabaMap) => Araba.fromJson(arabaMap)    //Araba.fromjson fonku ilede listenin elemanlarını Arabaya cevirdii
              ).toList();

      debugPrint(tumArabalar.length.toString());

      return tumArabalar;
    } 
    catch (e) 
    {
      debugPrint(e.toString());
      return Future.error(e);                             //hatayı yakalayıp snapshot errora yolladım
    }

  }




}
