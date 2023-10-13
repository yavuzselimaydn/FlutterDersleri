import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {              // 'statefulW' veya 'stful' kod şablonları ile otomatik oluşturulur. 
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _sayac = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint("MyHomePage build metodu calisti.");
    return Scaffold(                                     // tüm ekranı tesmsil eder.
      appBar : AppBar(
        title: const Text("My Counter AppBar"),
      ),
      body: Center(                                      // tasarım yapılacak alanı temsil eder.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const NewMyTextWidget(),
            Text(_sayac.toString(),
            style: Theme.of(context).textTheme.headline1, // context yapısı ile material appdaki ayarladığım temaya erişerek onu kullandım.
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Butona tiklandi ve sayac : $_sayac");
          sayaciArtir();
        }, 
        child: const Icon(Icons.add),),
    );
  }

  void sayaciArtir() {
    setState(() {                 // değişiklik olacak widgetin build metodunu tetikler. SetState build metodunu, setStatetın içinde oldugu fonkun işi bitince tetikler.
      _sayac++;
    });
  }
}

class NewMyTextWidget extends StatelessWidget {
  const NewMyTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Butona basilma miktari :",
      style: TextStyle(fontSize: 24)
      );
  }
}
