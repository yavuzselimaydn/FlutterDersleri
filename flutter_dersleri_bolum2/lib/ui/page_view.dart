import 'package:flutter/material.dart';

class PageViewOrnek extends StatefulWidget {
  const PageViewOrnek({super.key});

  @override
  State<PageViewOrnek> createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  var mycontroller =PageController(initialPage: 0, keepPage: true, viewportFraction: 1);

  bool yatayEksen = true;
  bool pageSnapping = true;
  bool reverseSira = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: mycontroller,      //sayfalar arası gecisi kontrol eder
            scrollDirection: yatayEksen ? Axis.horizontal : Axis.vertical,
            reverse: reverseSira,
            pageSnapping: pageSnapping,    //hafif dokunusta sayfa gecisi saglar
            onPageChanged: (value) {       //sayfa gecilince tetiklenir
              debugPrint(value.toString());
            },
            children: [
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.amberAccent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "0. Sayfa",
                        style: TextStyle(fontSize: 24),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            mycontroller.jumpToPage(2);
                          },
                          child: const Text("2. sayfaya gec"))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.red.shade200,
                child: const Center(
                  child: Text(
                    "1. Sayfa",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 300,
                color: Colors.indigo.shade200,
                child: const Center(
                  child: Text(
                    "2. Sayfa",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 250,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Yatay eksende çalis"),
                      Checkbox(
                          value: yatayEksen,
                          onChanged: (a) {
                            setState(() {
                              yatayEksen = a!;
                            });
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Page Snapping"),
                      Checkbox(
                          value: pageSnapping,
                          onChanged: (a) {
                            setState(() {
                              pageSnapping = a!;
                            });
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text("Ters sırada calis"),
                      Checkbox(
                          value: reverseSira,
                          onChanged: (a) {
                            setState(() {
                              reverseSira = a!;
                            });
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
