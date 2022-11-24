import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class ParametresItem extends StatelessWidget {
  final String? label;
  final TextEditingController? textEditingController;
  final String? hint;
  final bool obscureText;
  final IconData? icon;

  // final Function? validator;
  final IconButton? suffixIcon;
  final Color? iconcolor;

  ParametresItem(
      {this.label,
      this.textEditingController,
      this.hint,
      this.obscureText = false,
      this.icon,
      //   this.validator,
      this.suffixIcon,
      this.iconcolor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          label!,
          style: TextStyle(
            color: AppColors.textColor,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .7,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
              border: Border.all(color: Colors.black38)),
          child: TextFormField(
            controller: textEditingController,
            // validator: validator,
            obscureText: obscureText,
            decoration: InputDecoration(
                icon: Icon(icon),
                border: InputBorder.none,
                iconColor: Colors.black26,
                hintText: hint,
                suffixIcon: suffixIcon),
          ),
        ),
      ],
    );
  }
/*
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            lep,
            style: TextStyle(
              color: AppColors.textColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.black38)),
            child: Center(
              child: TextField(controller:controller ,
                decoration: InputDecoration(
                  hintText: hint,
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        0,
                      ),
                      borderSide:
                      BorderSide(color: AppColors.BorderInputColor)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(.0))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                      BorderSide(color: Colors.grey.withOpacity(.0))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
*/

}
