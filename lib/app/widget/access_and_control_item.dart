import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccessControlItem extends StatelessWidget {
 bool isActive;
 String name;

 AccessControlItem({ required this.isActive,required this.name});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
           /* decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            height: 70,
            width: 70,*/

          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              "assets/images/avatar.png",
              width: 50,
              height: 50                                           ,
            ),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(isActive?"active":"not active"),
              ),
            ],
          ),
          Spacer(),
          CupertinoSwitch(
            // This bool value toggles the switch.
            value: isActive,
            activeColor: CupertinoColors.activeGreen,
            onChanged: (bool? value) {},
          )
        ],
      ));

  }
}
