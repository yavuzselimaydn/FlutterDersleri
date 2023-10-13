import 'package:flutter/material.dart';

class TextFieldIslemleri extends StatefulWidget {
  const TextFieldIslemleri({super.key});

  @override
  State<TextFieldIslemleri> createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailcontroller;                           // contorller formdan deger almak yada deger yollamak icin kuallanılır
  late FocusNode _focusNode;                                             // alana tıklandıgında olacak islemleri duzenlerim.
  int maxLineCount = 1;

  @override
  void initState() {                                                      //bir kere calısır, const gibi
    super.initState();
    _emailcontroller = TextEditingController(text: "emre@gmail.com");
    _focusNode = FocusNode();
    _focusNode.addListener(() {                                          // programlamada bir seydeki degisiklikleri surekli dinleyen yapi
      setState(() {                                                      //degisiklik ekrana yansısın diye
        if (_focusNode.hasFocus) {                                       // ınput alanına tıklandıysa yanı gırıldıyse calısır.                                                               
          maxLineCount = 3;                                              // ilk alana tıklandıgında satır sayıısını artırdım.
        } else {
          maxLineCount = 1;
        }
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _emailcontroller.dispose();                                          // controllerlar silinmedigi için elle siliyorum. Silmezsem bellek sızıntısı
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form İslemleri"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailcontroller,
              
              keyboardType: TextInputType.emailAddress,                // kalvyede sayı mı olcak harf mı ayarladım.
              textInputAction: TextInputAction.next,                   // klavyede cıkan enter tusunu degısebiliyorum.
              autofocus:true,                                          // birden fazla textdield varsa true olandan baslatır
              maxLines: maxLineCount,                                  // max satır sayısı
              maxLength: 10,                                           // max karakter sayısı
              
              onChanged: (String deger) {                              // input alanına her karekter gırısınde calısır.Çalıstıgında verının son halını verır.
                if (deger.length > 3) {
                  setState(() {                                        // altakı texte degısıklık gelsın diye
                    _emailcontroller.value = TextEditingValue(         // girdigim degeri controlera atadim.
                        text: deger,
                        selection: TextSelection.collapsed(             //imlecin sona goturdum.
                            offset: deger.length
                        )
                    );
                  });
                }
              },
              
              onSubmitted: (value) {                                    //yukardakınden farkı enterlandıgında clasır yanı onaylandıgınd
                print("submit $value");
              },
              
              decoration: const InputDecoration(
                  labelText: "label text",                              // baslık
                  hintText: "email giriniz",                            // alana ne girilcek onun ıcın yardumcu bılgı
                  prefixIcon: Icon(Icons.email),                        // bas kısma ıcon koyar dırek
                  suffixIcon: Icon(Icons.face_2_rounded),               // sona ıcon kouar
                  border: OutlineInputBorder(                           // kenarlara cızgı
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  filled: true,
                  fillColor: Colors.orange                             //ıcını boyadım
                  ),
              cursorColor: Colors.red,                                 // ımlec rengı
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailcontroller.text),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          )
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailcontroller.text =
                "selimaydin@gmail.com";                                    // textfieldlar arasındaki textdeki deger degismeddig için setstate ıcıne al
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
