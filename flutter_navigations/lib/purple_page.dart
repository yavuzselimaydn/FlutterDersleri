import 'package:flutter/material.dart';

class PurplePage extends StatelessWidget {
  const PurplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purple Page"), 
        backgroundColor: Colors.purple,
      ),
      body:Center(
        child:Column(
          children: [
            const Text(
              "Purple Page", 
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
                onPressed: () {     
                  Navigator.pushNamed(                     
                    context, "/orangePage",           
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700),
                child: const Text("Turuncu Sayfaya Git"),
              ),
          ],
        ),
      ),
    );
  }
}