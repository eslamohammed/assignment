// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:ass_project/src/core/app_strings.dart';

import '../utils/hex_color.dart';

class CustomInputText extends StatefulWidget {
  const CustomInputText({
    Key? key,
    required this.controller,
    required this.hintText,
    this.minLines,
    this.maxLines,
    this.labelText,
    this.prefixIcon,
    this.suffixicon,
    this.fillColor,
    this.top,
}):super(key: key);
  final double? top;
  final int? minLines;
  final int? maxLines;
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final IconData? suffixicon;
  final IconData? prefixIcon;
  final Color? fillColor;

  @override
  State<CustomInputText> createState() => _CustomInputTextState();
}

class _CustomInputTextState extends State<CustomInputText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          style: TextStyle(
            color: HexColor("#FFFFFF"),
            fontFamily: AppStrings.fontFamily2,
            fontSize: 12.08,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
          ),
          validator: (value){
            if(value == null || value.isEmpty){
              return 'Please Insert The required Data';//'${emptyErrorLabel}';
            }else{
              return null;
            }
          },
          keyboardType: TextInputType.multiline,
          minLines: widget.minLines != null ? widget.minLines : 1,
          maxLines: widget.maxLines != null ? widget.maxLines : 2,
          controller: widget.controller,
          obscureText: false,//widget.secure,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 27,horizontal: 26),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(15)),
            enabledBorder: OutlineInputBorder(
              borderSide:const BorderSide(width: 1,color: Colors.white,),
              borderRadius: BorderRadius.circular(15)),
            labelText: widget.labelText,
            labelStyle: const TextStyle(
              color: Colors.white,
              fontFamily: AppStrings.fontFamily2,
              fontSize: 12.0235,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            border: OutlineInputBorder(
              //borderSide: const BorderSide(width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: HexColor("999999"),
              fontFamily: AppStrings.fontFamily2,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
            ),
            prefixIcon: widget.prefixIcon != null ? Padding(
              padding: const EdgeInsets.all(0.0),
              child: Icon(
                widget.suffixicon,
                color: HexColor("#999999"),
                //size: 50,
              ), 
            ) : null ,
            suffixIcon: widget.prefixIcon != null ? Padding(
              padding: EdgeInsets.all(0.0),
              child: Icon(
                widget.suffixicon,
                color: HexColor("#999999"),
                //size: 50,
              ), 
            ) : null ,
            /*prefix: Icon(
              icon,
              color: HexColor("#999999"),
              //size: 50,
            )*/
      
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(
            //       width: 0, 
            //       style: BorderStyle.none,
            //   ),
            // ),
          ),
        );
  }
}