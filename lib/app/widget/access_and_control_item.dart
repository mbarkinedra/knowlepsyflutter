import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessControlItem extends StatelessWidget {
  bool isActive;
  String name;
  Function(bool) onChange;
  AccessControlItem({required this.isActive, required this.name,required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
        //  clipBehavior: Clip.antiAlias,
         // elevation: 5,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  "assets/images/avatar.png",
                  width: 50,
                  height: 50,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(name,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(isActive ? "active".tr : "notactive".tr),
                  ),
                ],
              ),
              Spacer(),
              CupertinoSwitch(
                // This bool value toggles the switch.
                value: isActive,
                activeColor: CupertinoColors.activeGreen,
                onChanged:onChange
                // (bool? value) {},
              )
            ],
          ),
        ));
  }
}
