import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// ignore: must_be_immutable
class ListViewKullanimi extends StatelessWidget {
  ListViewKullanimi({super.key});                                    // const u kaldırdım nedeni elemanlar sonradan eklenıyor cunku.

  List<Ogrenci> tumOgrenciler = List.generate(                       // 500 tane farklı eleman olusturmak için kullandım.
    500, 
    (index) => 
    Ogrenci(index + 1, "Ogrenci adı ${index + 1}", "Ogrenci soydadı ${index + 1}")
    );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Öğrenci Listesi"),),
      body: listViewBuilerSeparatedKullanim(),
    );
  }

  ListView listViewBuilerSeparatedKullanim() {
    return ListView.separated(                                    // kullanımı builder ile aynı nerrdeyse.
    itemBuilder: (BuildContext context, int index) {              // her eleman olustugunda context değeri verir ,item builder  
      var anlikOgrenci = tumOgrenciler[index];                    // context kendinden oncekki elemanların bilginsini tutar.
      return Card(                                             
        color: index %2 == 0 
          ? Colors.orange.shade100 
          : Colors.purple.shade100,
        child: ListTile(                                        
          onTap: () {
            index % 2 == 0   
              ? EasyLoading.instance.backgroundColor = Colors.red       // mainde yaptığım ayarlar default uygulama genelı.İstediğim yerde onu değiştirebilrim.
              : EasyLoading.instance.backgroundColor = Colors.orange;
            EasyLoading.showToast(                                        // toast mesaj gosterır
              "Elemana tıklandı",
              duration: const Duration(seconds: 3),                       // zamanlama
              dismissOnTap: true,                                         // süre bitmese bile baswka bır yere dokunuldugunda mesajı kapa.
              toastPosition: EasyLoadingToastPosition.bottom
            );                  
          },
          onLongPress: () {                                               //fonksıyonun nerden çağrılmış ona baktım yukarıda item ubilder context değeri veriyo.
            _alertDiyalogIslemleri(context, anlikOgrenci);                 //item builderin verdiği contexti fonka parametre olarak verdim.
          },
          title: Text(anlikOgrenci.isim),                       
          subtitle: Text(anlikOgrenci.soyisim),                 
          leading: CircleAvatar(
            child: Text(anlikOgrenci.id.toString()),
        ),
          ),
      );},                                              
    itemCount: tumOgrenciler.length,  

    separatorBuilder: (context, index) {                         // builder dan farklı bu parametreyi alır.
      var yeniIndex = index + 1;
      if(yeniIndex % 5 == 0){
          return const Divider(
          color: Colors.teal,
          thickness: 2,);
      } return SizedBox();
      
    },                         
  );
  }

  ListView listViewBuilderKullanimi() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {           // her bir eleman ekrana yazılmadan once calıstırılır. index 0 dan baslar ıtem Counta gıder.
        var anlikOgrenci = tumOgrenciler[index];
        return Card(                                              
          color: index %2 == 0 
            ? Colors.orange.shade100 
            : Colors.purple.shade100,
          child: ListTile(                                        // eger az elemanım varsa listview yada singlechild kullan. 
            onTap: () {
              print("eleman tıklnadı $index");                    // elemana tıklandıgında caılıscak fonk
            },
            title: Text(anlikOgrenci.isim),                       // eleman sayısı cok ıse ListView.builder ı kullan. 
            subtitle: Text(anlikOgrenci.soyisim),                 // .builder ekranda gozukecek elemnları olusturur. Gozukmeyenlerı hafızadan sıler. Performnas dostu
            leading: CircleAvatar(
              child: Text(anlikOgrenci.id.toString()),
          ),
                ),
        );
    },                                              
      itemCount: tumOgrenciler.length,                           // gostercegım lıstede kac eleman olcagı bılgısını gırerım
    );
  }

  ListView klasikListViewKullanim() {
    return ListView(                                            // scroll ozelliği için
      children: tumOgrenciler.map(                              // children benden içinde widget bulunan liste isteyodu bende .map ile onu sağladım.
        (Ogrenci ogr) => ListTile(                              // eger az elemanım varsa listview yada singlechild kullan. 
          title: Text(ogr.isim),                                // eleman sayısı cok ıse ListView.builder ı kullan. 
          subtitle: Text(ogr.soyisim),                          // .builder ekranda gozukecek elemnları olusturur. Gozukmeyenlerı hafızadan sıler. Performnas dostu
          leading: CircleAvatar(
            child: Text(ogr.id.toString()),
          ),
        )
      ).toList(),                                               
    );
  }
  
  void _alertDiyalogIslemleri(myContext, seciliOgrenci) {
    showDialog(                                                 // show diyalog benden bir context istiyor. Yani diyalogu nerede açıyım diye soruyor.
      barrierDismissible: false,                                // dialogu bos ekrana basarak kapatmayı onler.
      context: myContext, 
      builder: (context) {
        return  AlertDialog(                                    // dialog için hazır widget
          title: Text(seciliOgrenci.toString()),
          content: SingleChildScrollView(                       
            child: ListBody(                                     //aynı column gibi elemanları alt alata yazdırır.
              children: [
                Text("yavuzselimaydin" * 200),
                Text("yavuzselimaydin" * 200),
                Text("yavuzselimaydin" * 200),
              ],
            ),
          ),
          actions: [
            ButtonBar(                                          //Butonları yan yana koynaj istersem kullan.
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);                      // açık olan ekrandan bı onceki ekrana donmemı saglar.
                  }, 
                  child: const Text("KAPAT")
                ),
                TextButton(
                  onPressed: () {}, 
                  child: const Text("TAMAM")
                ),
              ],
            ),
          ],
        );
      }
    );        
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
  
  @override
  String toString() {
    return "Ogrenci : ${isim + " " + soyisim} , id : $id";
  }
}