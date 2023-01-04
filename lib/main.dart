import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/home_binding.dart';
import 'home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: ()=>HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}


