import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/app/widget/custom_button_login.dart';
import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
import 'package:knowplesy/app/widget/custom_input_login.dart';
import 'package:flutter/services.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/CustomSettingBleutooth.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../app/widget/custom_setting.dart';
import 'BraceletConnected.dart';
import 'package:device_info/device_info.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class ConnectBleutoothScreen extends StatefulWidget {
  // ConnectBleutoothScreen({super.key});

  @override
  State<ConnectBleutoothScreen> createState() => _ConnectBleutoothScreenState();
}

class _ConnectBleutoothScreenState extends State<ConnectBleutoothScreen> {
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  final List<BluetoothDevice> _devicesList = [];
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  @override
  void initState() {
    initBleList();
    super.initState();
    _buildListViewOfDevices();
    initPlatformState();
  }

//device name
  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData = <String, dynamic>{};

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'model': build.model,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'model': data.model,
    };
  }
//end device

//begin blue
  Future initBleList() async {
    await Permission.bluetooth.request();
    await Permission.bluetoothConnect.request();
    await Permission.bluetoothScan.request();
    await Permission.bluetoothAdvertise.request();
    flutterBlue.connectedDevices.asStream().listen((devices) {
      for (var device in devices) {
        print("device of : $device ");
        _addDeviceTolist(device);
      }
    });
    flutterBlue.scanResults.listen((scanResults) {
      for (var result in scanResults) {
        _addDeviceTolist(result.device);
      }
    });
    flutterBlue.startScan();
  }

  void _addDeviceTolist(BluetoothDevice device) {
    if (!_devicesList.contains(device)) {
      setState(() {
        _devicesList.add(device);
      });
    }
  }

  ListView _buildListViewOfDevices() {
    List<Widget> containers = [];

    for (BluetoothDevice device 
        in _devicesList.where((element) => element.name.isNotEmpty)) {
      print(device.name);
      containers.add(
        Column(
          children: [
            CustomSettingBleutooth(
              iconProfile: Icons.computer,
              text: device.name,
              text1: "click_to_connect".tr,
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (
                  context,
                ) =>
                        BraceletConnected()));
              },
            ),
          ],
        ),
      );
    }
    return ListView (
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
            child: Image.asset("assets/images/connect02.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Text(
                  'name_of_the_device'.tr,
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 13,
                    color: const Color(0xffffffff),
                    height: 1.0769230769230769,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
                // SizedBox(
                //   width: MediaQuery.of(context).size.width * .3,
                // ),
                Spacer(),
                Text(
                  Platform.isAndroid
                      ? 'Android Device Info'
                      : 'iOS Device Info',
                  style: TextStyle(
                    fontFamily: 'Poppins-SemiBold',
                    fontSize: 13,
                    color: const Color(0xffffffff),
                    height: 1.0769230769230769,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ],
            ),
          ),
          ...containers
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(child: _buildListViewOfDevices()),floatingActionButton: StreamBuilder<bool>(
      stream: FlutterBluePlus.instance.isScanning,
      initialData: false,
      builder: (c, snapshot) {
        if (snapshot.data!) {
          return FloatingActionButton(
            child: const Icon(Icons.stop),
            onPressed: () => FlutterBluePlus.instance.stopScan(),
            backgroundColor: Colors.red,
          );
        } else {
          return FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () => FlutterBluePlus.instance
                  .startScan(timeout: const Duration(seconds: 10)));
        }
      },
    ),

    );
  }
}
