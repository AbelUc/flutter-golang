import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/colors/app_colors.dart';
import 'package:flutter_golang/controllers/data_controller.dart';
import 'package:flutter_golang/screens/add_task.dart';
import 'package:flutter_golang/screens/edit_task.dart';
import 'package:flutter_golang/screens/view_task.dart';
import 'package:flutter_golang/screens/welcome_screen.dart';
import 'package:flutter_golang/widgets/button_widget.dart';
import 'package:flutter_golang/widgets/task.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  loadData() {
    Get.find<DataController>().getData();
  }

  @override
  Widget build(BuildContext context) {
    loadData();

    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253).withOpacity(0.5),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );
    GlobalKey<ScaffoldState> _key = GlobalKey();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetBuilder<DataController>(builder: (controller) {
              return controller.isDeleting == false
                  ? Container(
                      padding: const EdgeInsets.only(top: 70, left: 20),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF5882df),
                          )),
                      height: 300,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/header1.jpg"))),
                    )
                  : Container();
            }),
            GetBuilder<DataController>(builder: (controller) {
              return controller.isDeleting
                  ? Container(
                      width: double.maxFinite,
                      height: 500,
                      child: Center(
                          child: SpinKitThreeInOut(
                              size: 50.0,
                              itemBuilder: (_, int index) {
                                return DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: index.isEven
                                        ? Color(0xFF7a9ee6)
                                        : Color(0xFF2e3253),
                                  ),
                                );
                              })),
                    )
                  : Container();
            }),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GetBuilder<DataController>(builder: (controller){
                return controller.isDeleting==false?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.off(() => WelcomeScreen(),
                                  transition: Transition.leftToRightWithFade);
                            },
                            child: Icon(
                              Icons.home,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          SizedBox(width: 10,),

                          GestureDetector(
                            onTap: (){
                              Get.to(()=>AddTask(),transition: Transition.upToDown, duration: Duration(seconds: 1));
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              child: Icon(Icons.add, color: Colors.white,size:20),
                              decoration: BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(12)
                              ),
                            ),
                          ),
                        ]
                    ),
                    Row(
                      children: [

                        Icon(Icons.summarize, color: AppColors.secondaryColor),
                        const SizedBox(width: 10,),
                        Text('${Get.find<DataController>().myData.length}',
                          style: const TextStyle(
                              fontSize: 20
                          ),)
                      ],
                    )
                  ],
                ):Container();
              }),
            ),
            Flexible(
              child: GetBuilder<DataController>(builder: (controller) {
                return controller.isLoading == false &&
                        controller.isDeleting == false
                    ? ListView.builder(
                        itemCount: controller.myData.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            key: ObjectKey(index),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              child: TaskWidget(
                                text: controller.myData[index]["task"],
                                color: Colors.blueGrey,
                              ),
                            ),
                            onDismissed: (DismissDirection direction) {
                              if (direction == DismissDirection.startToEnd) {
                                // Left to right
                                print("Edit");
                              } else if (direction ==
                                  DismissDirection.endToStart) {}
                            },
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    barrierColor: Colors.transparent,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (_) {
                                      return Container(
                                        height: 500,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF2e3253)
                                              .withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.off(() => ViewTask(
                                                      myData: controller
                                                          .myData[index]));
                                                },
                                                child: ButtonWidget(
                                                    text: "View",
                                                    color: Colors.white,
                                                    backgroundColor:
                                                        Color(0xFF202e59)),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => EditTask(
                                                      myData: controller
                                                          .myData[index]));
                                                },
                                                child: ButtonWidget(
                                                    text: "Edit",
                                                    color: Colors.blue,
                                                    backgroundColor:
                                                        Color(0xFF202e59)),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                                return false;
                              } else {
                                controller.setDeleting = true;
                                controller.deleteData(
                                    int.parse(controller.myData[index]["id"]));
                                return Future.delayed(
                                    Duration(milliseconds: 1000), () {
                                  controller.setDeleting = false;
                                  return direction ==
                                      DismissDirection.endToStart;
                                });
                                // return true;//Future.value(direction == DismissDirection.endToStart);
                              }
                            },
                            background: leftEditIcon,
                            secondaryBackground: rightDeleteIcon,
                          );
                        })
                    : Container();
              }),
            )
          ],
        ),
      ),
    );
  }
}
