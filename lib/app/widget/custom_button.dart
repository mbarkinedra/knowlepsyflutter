import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback? onClick;
  Color color;
  double width;
  double hight;
  bool isload;

  CustomButton(
      {required this.text,
      required this.onClick,
      required this.color,
      required this.width,
      required this.hight,
      this.isload = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isload ? null : onClick,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(21)),
        height: hight,
        width: width,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 4,
            ),
            if (isload) CircularProgressIndicator(color: Colors.white)
          ],
        )),
      ),
    );
  }
}
