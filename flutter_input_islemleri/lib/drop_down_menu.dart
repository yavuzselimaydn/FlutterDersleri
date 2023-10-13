import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({super.key});

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? secilenSehir;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("drop down menu"),
      ),
      body: Center(
        
          child: DropdownButton<String>(
        items: const [
          DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
          DropdownMenuItem(value: "İzmir", child: Text("İzmir")),
          DropdownMenuItem(value: "Yalova", child: Text("Yalova")),
        ],
        onChanged: (secili) {
          setState(() {
            secilenSehir = secili!;
          });
        },
        hint: const Text("Seciniz:"),
        value: secilenSehir,
      )),
    );
  }
}
