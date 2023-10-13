import 'package:flutter/material.dart';
import 'package:flutter_json_api/local_json.dart';
import 'package:flutter_json_api/remote_api.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Http json"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> const LocalJson()));
              },
              child: const Text("Local json"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=> const RemoteApi()));
              },
              child: const Text("Remote Api"),
            ),
          ],
        ),
      ),
    );
  }
}