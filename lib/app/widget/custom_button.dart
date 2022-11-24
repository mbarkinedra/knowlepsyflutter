import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onClick;
  Color color;
  double width;
  double hight;

  CustomButton(
      {required this.text,
      required this.onClick,
      required this.color,
      required this.width,
      required this.hight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(21)),
        height: hight,
        width: width,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
