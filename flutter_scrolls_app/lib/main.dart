import 'package:flutter/material.dart';
import 'package:flutter_scrolls_app/custom_scroll_ve_slivers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
    runApp(const MyApp());                // "mateapp" kod şablonu ile main i ve MyApp ı otomatik oluşturdum.
    configLoading();                      // dokumnda nasıl yaptıysa oyle yaptım.
}

void configLoading() {                               // easy loadingi özelleştirmek için kullanıyorum.
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom  // eğer background color vb .şeylerle değiştirmek istiyorsam burası custom olmalı.
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: const CollapsableToolbarOrnke(),
      builder: EasyLoading.init(),                  // easy loading paketini initialize ettim.
    );
  }
}