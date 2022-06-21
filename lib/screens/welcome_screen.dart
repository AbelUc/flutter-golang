import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/screens/add_task.dart';
import 'package:flutter_golang/screens/all_task.dart';
import 'package:flutter_golang/widgets/button_widget.dart';
import 'package:flutter_golang/widgets/text_widget.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void loadData() {
    Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    //loadData();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding:
            const EdgeInsets.only(top: 100, bottom: 140, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
                text: const TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: Color(0xFF202e59),
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: "\nstart your beautiful day",
                    style: TextStyle(
                      color: Color(0xFF2e3253),
                      fontSize: 14,
                      //fontWeight: FontWeight.bold
                    ),
                  )
                ])),
            const SizedBox(
              height: 300,
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => AddTask(), transition: Transition.zoom);
              },
              child: const ButtonWidget(
                  text: "Add Task",
                  color: Colors.white,
                  backgroundColor: Color(0xFF202e59)),
            ),
            GestureDetector(
              onTap: () {
                Get.to(() => const AllTask(), transition: Transition.fade,
                duration: Duration(seconds: 1)
                );
              },
              child: const ButtonWidget(
                  text: "View All",
                  backgroundColor: Colors.white,
                  color: Color(0xFF202e59)),
            )
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
      ),
    );
  }
}
