import 'package:flutter/material.dart';

class OrangePage extends StatelessWidget {
  const OrangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orange Page"), 
        backgroundColor: Colors.orange,
      ),
      body:  Center(
        child:Column(
          children: [
            const Text(
              "Orange Page", 
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {     
                  Navigator.popUntil(context, (route) => route.isFirst);        // yığındaki ilk eleman harıc hespını cıkarır yanı en sayfaya doner 
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade700),
                child: const Text("En başa geri dön"),
            ),
            ElevatedButton(
                onPressed: () {     
                  Navigator.popUntil(context, (route) => route.settings.name == "/purplePage");    // 4 5 tane ard arda gıttım ve ortadakıye gıtmek ıcın kulllnadım
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                child: const Text("Mora geri dön"),
            ),
            ElevatedButton(
                onPressed: () {     
                  Navigator.popUntil(context, (route) => route.settings.name == "/"); 
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal.shade700),
                child: const Text("en başa dön"),
            ),
            ElevatedButton(
                onPressed: () {     
                  Navigator.of(context).pushNamedAndRemoveUntil(  // yani ilk elemana kadar hespını cıkar ve sonra ana sayfadan sonra yellow ıorayakoy.
                    "/yellowPage", (route) => route.isFirst);  
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
                child: const Text("sarıyı anasayfadan sonra ekle"),
            ),

          ],
        ),
      ),
    );
  }
}