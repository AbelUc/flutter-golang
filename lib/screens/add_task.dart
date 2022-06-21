import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/controllers/data_controller.dart';
import 'package:flutter_golang/screens/all_task.dart';
import 'package:flutter_golang/widgets/button_widget.dart';
import 'package:flutter_golang/widgets/text_field_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();
    bool _dataValidation(){
      if(nameController.text.trim()==''){
        Get.snackbar("Task name", "Task name is empty");
        return false;
      }else if(detailController.text.trim()==''){
        Get.snackbar("Task detail", "Task detail is empty");
        return false;
      }else{
        print("validated");
        return true;
      }
    }
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
            child: Column(
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
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF5882df),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    TextFieldWidget(
                        textController: nameController, textHint: "Task name"),
                    SizedBox(
                      height: 15,
                    ),
                    TextFieldWidget(
                        maxLine: 3,
                        textController: detailController,
                        textHint: "Task detail",
                    borderRadius: 20,),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if(_dataValidation()){
                          Get.find<DataController>().postData(nameController.text.trim(),
                              detailController.text.trim());
                          Get.to(() => const AllTask(), transition: Transition.circularReveal,
                              duration: Duration(seconds: 2)
                          );
                        }

                      },
                      child: const ButtonWidget(
                          text: "Add",
                          color: Colors.white,
                          backgroundColor: Color(0xFF202e59),
                      ),
                    ),
                    const SizedBox(
                      height: 280,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
