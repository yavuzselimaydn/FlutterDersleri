import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class TarihSaatOrnek extends StatefulWidget {
  const TarihSaatOrnek({super.key});

  @override
  State<TarihSaatOrnek> createState() => _TarihSaatOrnekState();
}

class _TarihSaatOrnekState extends State<TarihSaatOrnek> {
  @override
  Widget build(BuildContext context) {
    DateTime suan = DateTime.now();  //suankı tarıh
    DateTime altiayoncesi = DateTime(2023,suan.month.toInt()-6);
    DateTime yirmiGunSonrasi = DateTime(2023,suan.day+15);
    TimeOfDay suankiSaat = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(title: const Text("tarih ve saat işlemleri")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                showDatePicker(
                  context: context, 
                  initialDate: suan, 
                  firstDate: altiayoncesi,           // gıdılebılcek en eskı tarıh
                  lastDate: yirmiGunSonrasi,         //gıdılebılcek en ılerı tarıh
                ).then(
                    (secilengun) {
                      print(secilengun.toString());
                      print(secilengun!.toIso8601String());
                      print(secilengun.microsecondsSinceEpoch.toString());
                      print(secilengun.add(Duration(days: 25)).toString());

                      var yeniDate = DateTime.parse(secilengun.toString());          //stirng tarıhı datetıme donusturdum
                      print(yeniDate);
                      print(formatDate(secilengun, [yyyy, '-', mm, '-', dd]));       //date_format pack ile 
                    }
                  );
              }, 
              child: const Text("tarih sec")
            ),
            
            ElevatedButton(
              onPressed: () {
                showTimePicker(
                  context: context, 
                  initialTime: suankiSaat
                ).then(
                    (value) {
                      print(value!.format(context));
                      print(value.hour.toString() + " : " + value.minute.toString());
                    }
                  );
              }, 
              child: const Text("zaman sec")  
            )
          ],
        )
      ),
    );
  }
}