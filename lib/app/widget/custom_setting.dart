import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/config/app_colors.dart';

class CustomSetting extends StatelessWidget {
  final String? text, icon;
  final VoidCallback? press;

  final IconData? iconProfile;

  const CustomSetting(
      {Key? key,
        this.text,
        this.icon,
        this.press,
        this.iconProfile,
   })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.BorderColore, padding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor: Color(0xFFF5F6F9),
            ),
            onPressed: press,
            child: Row(
              children: [
                Icon(
                  iconProfile,
                  color: AppColors.IconColor,
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Text(
                      text!,
                      style: TextStyle(
                          color:AppColors.textColor, fontWeight: FontWeight.bold),
                    )),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.IconColor,
                ),
              ],
            ),
          ),
        ),


      ],
    );
  }
}
