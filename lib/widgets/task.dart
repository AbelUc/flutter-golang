import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/widgets/text_widget.dart';

class TaskWidget extends StatelessWidget {
  final String text;
  final Color color;

  const TaskWidget({Key? key, required this.text, required this.color, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: const EdgeInsets.only(left: 10, right: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color:Color(0xFFedf0f8),
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(child: TextWidget(text: text, fontSize: 20,color: color,)),

    );
  }
}