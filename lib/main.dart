import 'package:flutter/material.dart';
import 'package:flutter_golang/controllers/data_controller.dart';
import 'package:flutter_golang/screens/add_task.dart';
import 'package:flutter_golang/screens/all_task.dart';
import 'package:flutter_golang/screens/welcome_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // DataController dataController = Get.put(DataController());
    Get.lazyPut(()=>DataController(), fenix: true);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
