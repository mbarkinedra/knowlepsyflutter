import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:get/get.dart';
import 'package:knowplesy/presentation/controllers/setting_controller/acces_control_controller/acces_control_controller.dart';
import '../../../../../app/widget/access_and_control_item.dart';
import 'add_caregiver/add_caregiver.dart';
import 'add_doctor/add_doctor.dart';

class AccessControlPage extends GetView<AccessControlController> {
  const AccessControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getAllCaregiver();
    controller.getDoctor();
    return Scaffold(
      body: Column(
        children: [
          Container(
              height: 80,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Spacer(),
                  Text("access and control".tr,
                      style: TextStyle(color: Colors.white, fontSize: 23)),
                  Spacer(),
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/avatar.png",
                          width: 60,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (
                              context,
                            ) =>
                                    AddCaregiver()));
                          },
                          child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.purple, shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text('add_caregiver'.tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/avatar.png",
                          width: 60,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (
                              context,
                            ) =>
                                    AddDoctorController()));
                          },
                          child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.purple, shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text("add_a_doctor".tr,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16))
              ],
            ),
          ),
          GetBuilder<AccessControlController>(builder: (logic) {
            return controller.getDoctorJson == null?SizedBox(): Column(
                children: logic.getDoctorJson!.data!.map((e) {
                  return AccessControlItem(
                      onChange: (bool v) {
                        e.stateDoctor = v ? 1 : 0;

                        controller.switchActiveOrNotActiveDoctor(
                          activeOrNotActive: v,
                          dataDoctor: e,
                        );
                        logic.update();
                      },
                      isActive: e.stateDoctor == 1 ? true : false,
                      name: "${e.doctorconsultation?.firstName}");
                }).toList());
          }),

          Expanded(child: GetBuilder<AccessControlController>(builder: (logic) {
            return logic.getAllCaregiverJson == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )

                : ListView.builder(
                    itemCount: logic.getAllCaregiverJson?.data?.length,
                    itemBuilder: (context, pos) {
                      print(logic.getAllCaregiverJson!.data![pos]
                          .seizurecaregiver?.id);
                      return Dismissible(
                          background: Container(
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              size: 35,
                              color: Colors.white,
                            ),
                          ),
                          key: Key(logic.getAllCaregiverJson!.data![pos].id
                              .toString()),
                          onDismissed: (direction) {
                            logic.deleteCaregiver(
                                caregiverseizure:
                                    logic.getAllCaregiverJson!.data![pos]);
                          },
                          child: AccessControlItem(
                              onChange: (bool v) {
                                logic.getAllCaregiverJson?.data?[pos]
                                    .activeCaregiver = v ? 1 : 0;

                                controller.switchActiveOrNotActive(
                                  activeOrNotActive: v,
                                  dataE: logic.getAllCaregiverJson!.data![pos],
                                );
                                logic.update();
                              },
                              isActive: logic.getAllCaregiverJson?.data?[pos]
                                          .activeCaregiver ==
                                      1
                                  ? true
                                  : false,
                              name:
                                  "${logic.getAllCaregiverJson?.data?[pos].caregiverseizure?.firstName}"));
                    });
          })),


        ],
      ),
    );
  }
}
