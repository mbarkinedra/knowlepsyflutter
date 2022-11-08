import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knowplesy/presentation/controllers/home_controller.dart';

class WidgetDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        backgroundColor: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          //  width: MediaQuery.of(context).size.width * 0.3, //70% of the screen
          child: Column(
            // padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                  height: 100,
                  child: Center(
                    child: _buildDrawerItem(
                        isSelect:
                            Get.find<HomeController>().navigatorValue == 5,
                        onTap: () {},
                        image: Icons.menu,
                        label: "Menu"),
                  )),
              Expanded(child: _buildDrawerList()),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn-icons-png.flaticon.com/512/206/206881.png"),
                    backgroundColor: Colors.deepPurple,
                    maxRadius: 25,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("se"),
                      Text("Brigitte Marie"),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                height: 1,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "LogOut",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerList() {
    return ListView(
      children: [
        Divider(
          thickness: 1,
          height: 1,
        ),
        _buildDrawerItem(
            isSelect: Get.find<HomeController>().navigatorValue == 0,
            label: 'Home',
            image: CupertinoIcons.home,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(0);
            }),
        _buildDrawerItem(
            isSelect: Get.find<HomeController>().navigatorValue == 1,
            label: 'Seizure',
            image: CupertinoIcons.waveform_path,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(1);
            }),
        _buildDrawerItem(
            isSelect: Get.find<HomeController>().navigatorValue == 2,
            label: 'Setting',
            image: CupertinoIcons.play_arrow,
            onTap: () {
              Get.find<HomeController>().changeSelectedValue(2);
            }),
      ],
    );
  }

  _buildDrawerItem(
      {required String label,
      required IconData image,
      required VoidCallback onTap,
      required bool isSelect}) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(right: 42.0, left: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(image,
                      color: isSelect ? Colors.deepPurple : Colors.grey),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Text(label,
                      style: TextStyle(
                        color: isSelect ? Colors.deepPurple : Colors.grey,
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0,
                      ),
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
