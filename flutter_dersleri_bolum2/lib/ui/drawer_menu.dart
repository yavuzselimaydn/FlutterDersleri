import 'package:flutter/material.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final String url =
      "https://img.ulusal.com.tr/rcman/Cw820h461q95gc/storage/files/images/2023/08/21/trabzonspor-bruno-petkovici-bekliyor-Udhy.jpg";
  
  @override
  Widget build(BuildContext context) {
    return Drawer(                           //scaffold da tanımlanır
        child: Column(
          children: [
            UserAccountsDrawerHeader(        //profil ile ilgili bbilgileri burada veririm
              accountName: const Text("Yavuz Selim Aydın"),
              accountEmail: const Text("yavuzselimaydn6@gmail.com"),
              currentAccountPicture: Image.network(
                url,
                fit: BoxFit.cover,
              ),
              otherAccountsPictures: const [  //fazladan hesap varsa kullanırım resım olrak gosterır
                CircleAvatar(
                  backgroundColor: Colors.deepOrange,
                  child: Text("YSA"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.limeAccent,
                  child: Text("AH"),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Anasayfa"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.cabin_outlined),
                    title: Text("Ara"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.fast_forward),
                    title: Text("Profil"),
                  ),
                  const Divider(),
                  InkWell(                     //nesneye tıklanma ozelligi verir efektıde verır. efekt gesturoda yok
                    onTap: () {},
                    splashColor: Colors.cyan,//tıklandıgınfda renk degısımı sahlasdr
                    child: const ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Anasayfa"),
                    ),
                  ),
                  //about listtile da uygulama hakkinda surum bilgisi verir.
                ],
              ),
            )
          ],
        ),
      );
  }
}