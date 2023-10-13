import 'package:flutter/material.dart';

String _imgUrl = "https://parkers-images.bauersecure.com/wp-images/17053/930x620/00-parkers-best-new-cars-coming-2023-2024-polestar-4-lead-alt.jpg";
String _logoUrl = "https://i.pinimg.com/736x/4f/eb/99/4feb9991ec193b7e139f06347c143f6d.jpg";

class ImageOrnekleri extends StatelessWidget {
  const ImageOrnekleri({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,              //fadeınımage  x eksenınde yayılsın dıye yaptım 
        children: [
          IntrinsicHeight(                                           // icindeki elemanlardan yuksekliği en buyuk olanı secıp dıgerlerının yukseliğini ona göre buyutuyor.
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,        // IntrinsicHeight nin çalışması için gerekli
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Image.asset(                              // resmi dosyadan resmi alır.
                      "assets/images/car.jpg", 
                      fit: BoxFit.cover,
                      )
                    ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Image.network(                           // resmi internetten çeker.
                      _imgUrl,
                      fit: BoxFit.cover,
                      ),
                    ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.red.shade100,
                    child: Padding(
                      padding: EdgeInsets.all(8),                   // CircleAvatarı containerdan 8 pixel uzaklastırıyo.    
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,             // arka plan rengi
                        foregroundColor: Colors.red,              // içine koyulan cocugun rengi
                        backgroundImage: NetworkImage(_logoUrl),    // arka plan resmı. provedir oldugu için AssetImage ıle verıyom.
                      ),
                    )
                    ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,                                      
            child: FadeInImage.assetNetwork(                  // internetten foto çekerken , fotograf gelene kadaar baska bir foto gostermemı saglar.
              fit: BoxFit.cover,                              // yukseklık verdıkten osnra resim tum alana yaılmasını ıstıyorsam , ilk once cross columa sonra bu
              placeholder: "assets/images/loading.gif", 
              image: _imgUrl),
          ), 
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Placeholder(),                            // Yer tutucu , yani buarya resim gelecek.
            )
            )
        ],
      ),
    );
  }
}