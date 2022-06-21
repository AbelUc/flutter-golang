import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowTask extends StatelessWidget {
  final String text;

  const ShowTask({Key? key,
    required this.text,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(text);
    return Container(
      width: double.maxFinite,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFFedf0f8)
      ),
      child: Text(text,
      //  softWrap: true,
        style: TextStyle(
          color: Color(0xFF2e3253)
        ),
      ),
    );
  }
}
