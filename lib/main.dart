import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlife_database/bindings/all_bindings.dart';
import 'package:sqlife_database/screen/home_page.dart';

void main() {
  Allbindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

