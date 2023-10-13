import 'package:flutter/material.dart';

class GridViewOrnek extends StatelessWidget {
  const GridViewOrnek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid View Orneks"),
      ),
      body: gridViewBuilderKullanim(),
    );
  }

  GridView gridViewBuilderKullanim() {
    return GridView.builder(
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(  // .count veya .extente oldugu gibi satırda yada sutunda kac elelman oldugu bilgisi girilir.
        crossAxisCount: 2,
      ),    
      itemCount: 100,
      itemBuilder: (context, index) {
        return GestureDetector(                                         // erkran ile etkileşimleri yakalamak iççin kullanıyorm.
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.red[100 * ((index + 1) % 9)],
              gradient: const LinearGradient(                              // renk geçişi sağlar. Kullanırsam colorın işlevi kalmaz.
                colors: [Colors.blue, Colors.red],
                begin: Alignment(-1,-1),                                   // geçişin baslıyacagı yer.
                end: Alignment.bottomRight,                                // bitecegi  yer.
              ),
              image: const DecorationImage(
                image: NetworkImage("https://thurrott.s3.amazonaws.com/2019/05/flutter-mobile-web-desktop.jpg"),  // image provedir istediği icin boyle kullandım.
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
              border: Border.all(
                color: Colors.black,
                width: 5,   
                style: BorderStyle.solid
              ),
              //borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow:const [
                BoxShadow(
                  color: Colors.red,
                  offset: Offset(10, 10),
                  blurRadius: 20
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child:  Text(
                "Yavuz Selim Aydin",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          onTap: () => debugPrint("1 kere basildi."),
          onDoubleTap: () => debugPrint("iki kere basildi"),
          onLongPress: () => debugPrint("uzun basildi."),
        );
      },
      padding: const EdgeInsets.all(10),
    );
  }

  GridView gridViewExtentKullanim() {              
    return GridView.extent(
      scrollDirection: Axis.vertical,             // burada  scrool yukaridan asagıyadır. Burda mainaxis y  ekseni , crosaxis ise x eksenidir.
      maxCrossAxisExtent:400,                     // .count tan ayrı bu ozellıgı alır. Bu ozellık --> her bır elemanın maximum buyuklugunu belirtiirm.
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
//.count kullanımında satırad yada sutunda kac eleman olcagını. .extent de ise satırdakı veya sutundakı elemaın buyuklugunu soylerım.
  GridView sagdansolaScroll() {
    return GridView.count(
      scrollDirection: Axis.horizontal,       // scrool sağdan soladır burda. Yani mainaxis x ekseni , corss ise y ekseni.
      crossAxisCount: 2,
      primary: false,                         // scroll gerkmez ise scroll yapmaz bu drumda.
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  GridView yukaridanAsagiyaScroll() {
    return GridView.count(                                // burada scroll default olarak vertical yani yukarıdan asagıyadır.  
      scrollDirection: Axis.vertical,                     // burada  scrool yukaridan asagıyadır. Burda mainaxis y  ekseni , crosaxis ise x eksenidir.
      crossAxisCount:3,                                   // yani satırda (x eksenınde) kac eleman olsun onu sıtıyor.
      primary: false,
      padding: const EdgeInsets.all(10),                 // her bir ogenın etrafında 10 ar bırım bosluk
      crossAxisSpacing: 20,                              // bir satırdaki elemanların arsaındaki bosluk
      mainAxisSpacing: 40,                               // bir sütündaki elemanlarına rsındaki bosluk
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: const Text(
            "Yavuz Selim Aydin",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
