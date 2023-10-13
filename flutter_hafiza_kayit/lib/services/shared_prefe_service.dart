import 'package:flutter_hafiza_kayit/model/my_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{

  verileriKaydet(UserInformation userInfo) async {
    final name = userInfo.isim;
    final preference = await SharedPreferences.getInstance(); //dosyaya erisiyorum buda

    preference.setString("isim", name); //set ile verileri dosyaya yazıtorum
    preference.setInt("cinsiyet", userInfo.cinsiyet.index);
    preference.setStringList("renkler", userInfo.renkler);
    preference.setBool("ogrenciMi", userInfo.ogrenciMi);
  }

  Future<UserInformation> verileriOku() async {
    final preference = await SharedPreferences.getInstance();

    var isim =  preference.getString("isim") ?? ""; // get ile verileri okudum
    var secilenCinsiyet = Cinsiyet.values[preference.getInt("cinsiyet") ?? 0]; // okurken ve yzarken keyler onemli
    var secilenRenkler = preference.getStringList("renkler") ?? [];
    var ogrenciMi = preference.getBool("ogrenci") ?? false;
    
    return UserInformation(isim: isim, cinsiyet: secilenCinsiyet, renkler: secilenRenkler, ogrenciMi: ogrenciMi);

    
  }

  
}