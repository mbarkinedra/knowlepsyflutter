import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback onClick;
  Color color;
  double width;
  double hight;
  ImageIcon icon;

  CustomButton(
      {required this.text,
      required this.onClick,
      required this.color,
      required this.width,
      required this.icon,
      required this.hight});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(26)),
        height: hight,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(fit: BoxFit.fill,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ImageIcon(
                  icon.image,
                  color: Colors.white,
                ),

                Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
