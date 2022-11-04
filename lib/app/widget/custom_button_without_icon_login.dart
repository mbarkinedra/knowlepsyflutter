import 'package:flutter/material.dart';

class CustomButtonWithoutIcon extends StatelessWidget {
  String text;
  VoidCallback onClick;
  Color color;
  double width;
  double hight;

  CustomButtonWithoutIcon(
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
            color: color, borderRadius: BorderRadius.circular(26)),
        height: 51,
        width: 223,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
