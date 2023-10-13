import 'package:flutter/material.dart';

class Bulsayfa extends StatelessWidget {
  const Bulsayfa(Key? k) : super(key: k);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemExtent: 250,itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(  //material ile diyelim ki bir widgetta raidıs yok onu sarmalar ve eklerım theme daki gibi
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          color: index % 2 == 0 ? Colors.indigo.shade400 : Colors.orange.shade400,
          child: Center(
            child: Text(
              "$index",
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
    });
  }
}
