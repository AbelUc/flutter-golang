import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String textHint;
  int? maxLine;
  double? borderRadius;
   TextFieldWidget({Key? key, required this.textController,
    required this.textHint, this.maxLine=1, this.borderRadius=30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLine,
      controller: textController,
      decoration: InputDecoration(
        filled: true,
          hintText: textHint,
          fillColor: Color(0xFFedf0f8),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                  color:Colors.white,
                  width: 1.0
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
              borderSide: BorderSide(
                  color:Colors.white,
                  width: 1.0
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius!)
          )
      ),
    );
  }
}
