import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hafiza_kayit/model/my_model.dart';
import 'package:flutter_hafiza_kayit/services/shared_prefe_service.dart';

class SharedPrefenceKullanimi extends StatefulWidget {
  const SharedPrefenceKullanimi({super.key});

  @override
  State<SharedPrefenceKullanimi> createState() =>
      _SharedPrefenceKullanimiState();
}

class _SharedPrefenceKullanimiState extends State<SharedPrefenceKullanimi> {
  var secilenCinsiyet = Cinsiyet.KADIN;
  List<String> secilenRenkler = [];
  var ogrenciMi = false;

  var controller = TextEditingController();

  var preferenceService = SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("shared prefence kullanimi"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: "adinizi giriniz"),
            ),
          ),

          for (var cins in Cinsiyet.values)
            _buildRadioListTile(describeEnum(cins), cins),

          for (var renk in Renkler.values) _buildCheckBoxListTile(renk),

          SwitchListTile(
            title: const Text("Ogrenci misin?"),
            value: ogrenciMi,
            onChanged: (bool deger) {
              setState(() {
                ogrenciMi = deger;
              });
            },
          ),

          TextButton(
              onPressed: () {
                var userInfo = UserInformation(isim: controller.text, cinsiyet: secilenCinsiyet, renkler: secilenRenkler, ogrenciMi: ogrenciMi);
                preferenceService.verileriKaydet(userInfo);
              },
              child: const Text("Kaydet"))
        ],
      ),
    );
  }

  Widget _buildCheckBoxListTile(Renkler renk) {
    return CheckboxListTile(
      title: Text(describeEnum(renk)),
      value: secilenRenkler.contains(describeEnum(renk)),
      onChanged: (bool? deger) {
        if (deger == false) {
          secilenRenkler.remove(describeEnum(renk));
        } else {
          secilenRenkler.add(describeEnum(renk));
        }
        setState(() {});
        debugPrint(secilenRenkler.toString());
      },
    );
  }

  Widget _buildRadioListTile(String title, Cinsiyet cins) {
    return RadioListTile(
      title: Text(title),
      value: cins,
      groupValue: secilenCinsiyet,
      onChanged: (secilmisCinsiyet) {
        setState(() {
          secilenCinsiyet = secilmisCinsiyet!;
        });
      },
    );
  }
  
  void _verileriOku() async {
    var info = await preferenceService.verileriOku();

    controller.text = info.isim;
    secilenCinsiyet = info.cinsiyet;
    secilenRenkler = info.renkler;
    ogrenciMi = info.ogrenciMi;

    setState(() {}); // awaitden olusan beklemeden dolayı dosyayı okuma islemini es gecerek scafoldan ekranı cizer,sonra dosya okuma biter ama ekrana yansımaz bunu ekrana yansıtmak icin setsstate kullnadım
  }
}
