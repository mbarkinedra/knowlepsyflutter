import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String lep;
  final String hint;
  TextEditingController? controller;
  bool des;
  TextInputType keyboardType;
  final Function validator;

  CustomInput({
    required this.lep,
    required this.keyboardType,
    this.hint = "",
    this.controller,
    this.des = true,
    required this.validator,
  });

  @override
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
            height: 60,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.black38)),
            child: Center(
              child: TextFormField(
                keyboardType: keyboardType,
                validator: (v) {
                  return validator(v);
                },
                controller: controller,
                enabled: des,
                decoration: InputDecoration(
                  hintText: hint,
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
                  // errorBorder: OutlineInputBorder(
                  //     borderRadius: BorderRadius.circular(
                  //
                  //       borderSide: 0,
                  //     ),
                  //         BorderSide(color: AppColors.BorderInputColor)),
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
