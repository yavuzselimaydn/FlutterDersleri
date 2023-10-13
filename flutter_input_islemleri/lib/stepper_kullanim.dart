import 'package:flutter/material.dart';

class SteperOrnek extends StatefulWidget {
  const SteperOrnek({super.key});

  @override
  State<SteperOrnek> createState() => _SteperOrnekState();
}

class _SteperOrnekState extends State<SteperOrnek> {
  int aktifStep = 0;
  String? isim,email,sifre;
  String? dogruIsim,demail,dsifre;
  
  bool hata = false;  // validate de hata olursa step state kontrolunda kullanulacak
  
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stepper kullanım")),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stepper(
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    ElevatedButton(onPressed: details.onStepContinue, child: const Text("Devam")),
                    const SizedBox(width: 30,),
                    ElevatedButton(onPressed: details.onStepCancel, child: const Text("Geri")),
                  ],
                );
              },

              steps: _tumStepler(),

              currentStep: aktifStep,                      // icinde olunan stepin listedeki indexi
              
              /*onStepTapped: (tiklanilanStep) {             // tıklanılan stepi ıptalettım cunku ocntınue ıle gıtıssn ıstıyorum
                setState(() {
                  aktifStep = tiklanilanStep;
                });
              },*/

              onStepContinue: () {                          // contınue butonunu duzenledim
                setState(() {
                  continueeKontrol();
                });
              },  

              onStepCancel: () {
                setState(() {
                  if(aktifStep > 0){
                    aktifStep--;
                  }else{
                    aktifStep = 0;
                  }
                });
              },                 
            ),
            const SizedBox(height: 20,),
            
            Container(
              height: 100,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 2)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("İSİM : $dogruIsim"),
                  Text("EMAİL : $demail"),
                  Text("Sifre : $dsifre"),
                ]
              ),
            )
          ],
        ),
        
      ),
    );
  }
  
  List<Step> _tumStepler() {                 //steplerı olusturdum kontroller yukarıda
    List<Step> stepler =  [
      Step(
        title: const Text("username baslık"), 
        subtitle: const Text("username alt baslık"),
        isActive: true, 
        state: _stateleriAyarla(0),     //adımın durumu
        content: TextFormField(
          key : key0,
          decoration: const InputDecoration(
            hintText: "Username hint",
            labelText: "username label",
            border: OutlineInputBorder()
          ),
        validator: (value) {
          if(value!.length < 6){
            return "isim 6 karakterden uzun olmalı";
          }
        },
        onSaved: (girilendeger) {
          isim = girilendeger;
        },
        )
      ),
      Step(
        title: const Text("mail baslık"), 
        subtitle: const Text("mail alt baslık"),
        isActive: true, 
        state:  _stateleriAyarla(1),     //adımın durumu
        content: TextFormField(
          key : key1,
          decoration: const InputDecoration(
            hintText: "mail hint",
            labelText: "mail label",
            border: OutlineInputBorder()
          ),
        validator: (value) {
          if(!value!.contains("@")){
            return "mail @ olmalı";
          }
        },
        onSaved: (girilendeger) {
          email = girilendeger;
        },
        )
      ),
      Step(
        title: const Text("sifre baslık"), 
        subtitle: const Text("sifre alt baslık"),
        isActive: true, 
        state:  _stateleriAyarla(2),     //adımın durumu
        content: TextFormField(
          key : key2,
          decoration: const InputDecoration(
            hintText: "sifre hint",
            labelText: "sifre label",
            border: OutlineInputBorder()
          ),
        validator: (value) {
          if(value!.length < 6){
            return "sifre 6 karakterden uzun olmalı";
          }
        },
        onSaved: (girilendeger) {
          sifre = girilendeger;
        },
        )
      )
    ];

    return stepler;
  }
  
  StepState _stateleriAyarla(int oAnkiStep) {
    if(aktifStep == oAnkiStep ){
       if(hata){
         return StepState.error;
       }
       else{
         return StepState.editing; 
       }
    }
    else {
      return StepState.complete;
    }
  }
  
  void continueeKontrol() {
    
    switch(aktifStep){
      case 0:
        if(key0.currentState!.validate()){
          key0.currentState!.save();
          hata = false;
          aktifStep++;
        }else{
          hata = true;
        }
        break;

        case 1:
        if(key1.currentState!.validate()){
          key1.currentState!.save();
          hata = false;
          aktifStep++;
        }else{
          hata = true;
        }
        break;

        case 2:
        if(key2.currentState!.validate()){
          key2.currentState!.save();
          hata = false;
          formTamamlandi();
        }else{
          hata = true;
        }
        break;


    }
  }
  
  void formTamamlandi() {
    dogruIsim = isim;
    demail = email;
    dsifre = sifre;
  }
}