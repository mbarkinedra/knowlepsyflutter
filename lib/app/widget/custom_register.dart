import 'package:flutter/material.dart';
import 'package:knowplesy/app/util/font_size.dart';

import '../util/app_colors.dart';

class CustomRegister extends StatelessWidget {
  final String label;
  final String hint;
  TextEditingController? controller;
  final Function validator;
  bool des;

  CustomRegister({required this.label, this.hint = "",  this.controller, required this.validator,this.des=true});

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
              color: AppColors.textColor,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            // height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.black38)),
            child: Center(
              child: TextFormField(controller:controller ,enabled: des,
                validator: (v){
                  return   validator(v);
                },
                decoration: InputDecoration(
                  hintText: hint,
                  fillColor: Colors.white,
                  filled: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.grey),
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
