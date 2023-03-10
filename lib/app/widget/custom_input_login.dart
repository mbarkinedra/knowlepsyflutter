import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class CustomInputLogin extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textEditingController;
  final bool obscureText;
  final IconButton? suffixIcon;
  final IconData? icon;
  final Function validator;
  final Color color;

  CustomInputLogin(
      {required this.label,this.color=Colors.black,
      this.icon,
      this.hint = "",
      required this.textEditingController,
      required this.validator,
      this.obscureText=false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            //height: 50,
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white)),
            child: Center(
              child: TextFormField(style: TextStyle(color:Colors.white ),
                validator: (v) {
                  return validator(v);
                },
                controller: textEditingController,
                 obscureText: obscureText,
                decoration: InputDecoration(
                  hintText: hint,
                  icon: Icon(
                    icon,
                    color: Colors.white,
                  ),
                  suffixIcon: suffixIcon,
                  fillColor: AppColors.primaryColor,
                  filled: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
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
}
