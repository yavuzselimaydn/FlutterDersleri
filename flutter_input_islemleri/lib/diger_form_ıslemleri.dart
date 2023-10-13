import 'package:flutter/material.dart';

class DigerFormIslemleri extends StatefulWidget {
  const DigerFormIslemleri({super.key});

  @override
  State<DigerFormIslemleri> createState() => _DigerFormIslemleriState();
}

class _DigerFormIslemleriState extends State<DigerFormIslemleri> {
  bool checkBoxState = false;
  bool checkBoxState2 = false;
  bool checkBoxState3 = false;

  String sehir = "";

  bool switchState = false;
  
  double sliderDeger =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dıger form işlemleri"),
        backgroundColor: switchState ? Theme.of(context).appBarTheme.backgroundColor : Colors.red
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            
            CheckboxListTile(
              value: checkBoxState,                // secılıp secılmedıgını tutar true yada false
              activeColor: Colors.red,
              title: const Text("Checkbox title 1"),
              subtitle: const Text("Checkbox subtitle 1"),
              selected: false,                     //active colora burunsun mu
              secondary: const Icon(Icons.add),
              onChanged: (secildi) {               // tıklandıgında calısır true deger dondurur.
                setState(() {                      // degısıklık ekranda algılansın dıye
                  checkBoxState = secildi!;
                });
              },      
            ),
            CheckboxListTile(
              value: checkBoxState2,               // secılıp secılmedıgını tutar true yada false
              activeColor: Colors.red,
              title: const Text("Checkbox title 2"),
              subtitle: const Text("Checkbox subtitle 2"),
              selected: false,                     //active colora burunsun mu
              secondary: const Icon(Icons.add),
              onChanged: (secildi) {              // tıklandıgında calısır true deger dondurur.
                setState(() {                     // degısıklık ekranda algılansın dıye
                  checkBoxState2 = secildi!;
                });
              },      
            ),
            Card(
              child: CheckboxListTile(
                value: checkBoxState3,                 // secılıp secılmedıgını tutar true yada false
                activeColor: Colors.red,
                title: const Text("Checkbox title 3"),
                subtitle: const Text("Checkbox subtitle 3"),
                selected: false,                       //active colora burunsun mu
                secondary: const Icon(Icons.add),
                onChanged: (secildi) {                 // tıklandıgında calısır true deger dondurur.
                  setState(() {                        // degısıklık ekranda algılansın dıye
                    checkBoxState3 = secildi!;
                  });
                },      
              ),
            ),

            RadioListTile(
              value: "Ankara", 
              groupValue: sehir, 
              title: const Text("Ankara"),
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                });
              }
            ),
            RadioListTile<String>(
              value: "İzmir",                      // radıo dugmesı secıldıgınde onu temsil eder change bu gider.
              groupValue: sehir,                   // Radio listleri gruplar ve tek bir tanesini secmemi saglar. gruopovalue ıle value eslesırse radıo lıst escılmıs sayılır.
              title: const Text("İzmir"),
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                });
              }
            ),
            RadioListTile(
              value: "Bursa", 
              groupValue: sehir, 
              title: const Text("Bursa"),
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  print(deger);
                });
              }
            ),

            SwitchListTile(
              title: switchState ? const Text("Mavi") : const Text("Kırmızı"),
              value: switchState, 
              onChanged: (deger) {
                setState(() {
                  switchState = deger;
                });
              }
            ),

            Slider( 
              value: sliderDeger, 
              min: 0,
              max: 100,
              divisions: 1000,
              label: sliderDeger.toString(),
              onChanged: (yeniDeger) {
                setState(() {
                  sliderDeger = yeniDeger;
                });
              } 
            )
          ],
        ),
      ),
    );
  }
}