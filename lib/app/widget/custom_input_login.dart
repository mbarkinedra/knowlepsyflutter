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
          Text(
            lep,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.yellow)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hint,
                  fillColor: AppColors.primaryColor,
                  filled: true,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        0,
                      ),
                      borderSide: BorderSide(color: Colors.white)),
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
