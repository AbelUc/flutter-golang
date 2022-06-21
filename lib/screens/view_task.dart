import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/controllers/data_controller.dart';
import 'package:flutter_golang/screens/all_task.dart';
import 'package:flutter_golang/widgets/button_widget.dart';
import 'package:flutter_golang/widgets/show_task.dart';
import 'package:flutter_golang/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class ViewTask extends StatelessWidget {
  Map<String, dynamic> myData;
  ViewTask( {Key? key, required this.myData}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/addtask2.jpg"))),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: GetBuilder<DataController>(builder: (controller){
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF5882df),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment,
                    children: [
                      ShowTask(text: myData["task"]),
                      const SizedBox(
                        height: 15,
                      ),
                      ShowTask(text: myData["task_detail"]),
                      const SizedBox(
                        height: 20,
                      ),

                    ],
                  ),
                  SizedBox(height: 200,)
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
