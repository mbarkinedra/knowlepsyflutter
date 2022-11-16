import 'package:flutter/material.dart';
import 'package:knowplesy/app/config/app_colors.dart';

class CustomSettingBleutooth extends StatelessWidget {
  final String? text, text1, icon;
  final VoidCallback? press;

  final IconData? iconProfile;

  const CustomSettingBleutooth({
    Key? key,
    this.text,
    this.text1,
    this.icon,
    this.press,
    this.iconProfile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.BorderColore,
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: const Color(0xFFF5F6F9),
            ),
            onPressed: press,
            child: Row(
              children: [
                Icon(
                  iconProfile,
                  color: AppColors.IconColorBlue,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        text!,
                        style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 05,
                      ),
                      Text(
                        text1!,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.IconColorBlue,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
