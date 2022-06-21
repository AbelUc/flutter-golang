import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_golang/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  const ButtonWidget({Key? key, required this.text, required this.color, required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: const EdgeInsets.only(left: 10, right: 20),
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height/14,
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(child: TextWidget(text: text, fontSize: 20,
        color:color,)),

    );
  }
}
