import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomInput extends StatelessWidget {
  final String lep;
  final String hint;

  CustomInput({required this.lep, this.hint = ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(lep),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black38)),
            child: Center(
              child: TextField(
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
}