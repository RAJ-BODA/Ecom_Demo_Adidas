import 'package:ecom_adidas_demo/UI/BottomBar/bottom_bar_screen.dart';
import 'package:ecom_adidas_demo/UI/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final dataStorage = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecom Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBarScreen(),
    );
  }
}
