import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldKullanim extends StatefulWidget {
  const TextFormFieldKullanim({super.key});

  @override
  State<TextFormFieldKullanim> createState() => _TextFormFieldKullanimState();
}

class _TextFormFieldKullanimState extends State<TextFormFieldKullanim> {
  String _email="", _username="", _password="";
  final _formKey = GlobalKey<FormState>();           //butondan form widgetına erismemi saglar key.
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text form field kullanim"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,            // validator aktiflestrdim.
            child: Column(
              children: [

                TextFormField(
                  //initialValue: "yavuzselimaydn6",
                  decoration: const InputDecoration(
                    labelText: "Username",
                    hintText: "Username",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (deger) {
                    _username = deger!;
                  },
                  validator: (value) {                               //girilen degeri kontrol eder.
                    if(value!.length < 6){
                      return "username en az 6 karakter olmalı";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  //initialValue: "yavuzselimaydn6@gmail.com",
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (deger) {
                    _email = deger!;
                  },
                  validator: (value) {
                    if(value!.isEmpty){
                      return "email bos olamaz";
                    }
                    else if(!EmailValidator.validate(value)){              // not yaptım cunku true ise calıscak
                      return "gecerli email giriniz";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),

                TextFormField(
                  //initialValue: "yavuzselimaydn6@gmail.com",
                  obscureText: true,                                //şifreyi gizler
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  onSaved: (deger) {
                    _password = deger!;
                  },
                  validator: (value) {
                    if(value!.length < 8){
                      return "sifre 8 karakter olmalı";
                    }else{
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if(_formKey.currentState!.validate()){            //validati buradan calısturdım. validatene gecersse alt calıscak
                      _formKey.currentState!.save();                  // alandaki degerleri degiskenkere atadım, onSaved teetiklendi.
                      
                      String result = "username:$_username\nemail:$_email\npassword:$_password";
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result, style:const TextStyle(fontSize: 24),)
                        )
                      );
                      _formKey.currentState!.reset();
                    }
                  }, 
                 child:const Text("Onayla"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}