// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:get/get.dart';
// import 'package:knowplesy/app/util/app_colors.dart';
// import 'package:knowplesy/app/widget/custom_button_login.dart';
// import 'package:knowplesy/app/widget/custom_button_without_icon_login.dart';
// import 'package:knowplesy/app/widget/custom_input_login.dart';
// import 'package:flutter/services.dart';
// import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/CustomSettingBleutooth.dart';
// import 'package:permission_handler/permission_handler.dart';
// import '../../../../app/widget/custom_setting.dart';
// import 'BraceletConnected.dart';
// import 'package:device_info/device_info.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
//
// class ConnectBleutoothScreen extends StatefulWidget {
//   // ConnectBleutoothScreen({super.key});
//
//   @override
//   State<ConnectBleutoothScreen> createState() => _ConnectBleutoothScreenState();
// }
//
// class _ConnectBleutoothScreenState extends State<ConnectBleutoothScreen> {
//   final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   final List<BluetoothDevice> _devicesList = [];
//   static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
//   Map<String, dynamic> _deviceData = <String, dynamic>{};
//   List<BluetoothService> services = [];
//
//   @override
//   void initState() {
//     initBleList();
//     super.initState();
//     _buildListViewOfDevices();
//     initPlatformState();
//   }
//
// //device name
//   Future<void> initPlatformState() async {
//     Map<String, dynamic> deviceData = <String, dynamic>{};
//
//     try {
//       if (Platform.isAndroid) {
//         deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
//       } else if (Platform.isIOS) {
//         deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
//       }
//     } on PlatformException {
//       deviceData = <String, dynamic>{
//         'Error:': 'Failed to get platform version.'
//       };
//     }
//
//     if (!mounted) return;
//
//     setState(() {
//       _deviceData = deviceData;
//     });
//   }
//
//   Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
//     return <String, dynamic>{
//       'model': build.model,
//     };
//   }
//
//   Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
//     return <String, dynamic>{
//       'name': data.name,
//       'model': data.model,
//     };
//   }
//
// //end device
//
// //begin blue
//   Future initBleList() async {
//     await Permission.bluetooth.request();
//     await Permission.bluetoothConnect.request();
//     await Permission.bluetoothScan.request();
//     await Permission.bluetoothAdvertise.request();
//     flutterBlue.connectedDevices.asStream().listen((devices) {
//       for (var device in devices) {
//
//         _addDeviceTolist(device);
//       }
//     });
//     flutterBlue.scanResults.listen((scanResults) {
//       for (var result in scanResults) {
//         _addDeviceTolist(result.device);
//       }
//     });
//     flutterBlue.startScan();
//   }
//
//   void _addDeviceTolist(BluetoothDevice device) {
//     if (!_devicesList.contains(device)) {
//       setState(() {
//         _devicesList.add(device);
//       });
//     }
//   }
//
//   ListView _buildListViewOfDevices() {
//     List<Widget> containers = [];
//     BluetoothDevice? connectedDevice;
//
//     for (BluetoothDevice device
//         in _devicesList.where((element) => element.name.isNotEmpty)) {
//       print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh  ======>${device.name}");
//       containers.add(
//         Column(
//           children: [
//             CustomSettingBleutooth(
//               iconProfile: Icons.computer,
//               text: device.name,
//               text1: "click_to_connect".tr,
//               press: () async {
//                 flutterBlue.stopScan();
//                 try {
//                   await device.connect();
//                   List<BluetoothService> services = await device.discoverServices();
//                   services.forEach((element) async{
//                     // Reads all characteristics
//                     var characteristics = element.characteristics;
//
//                     for(BluetoothCharacteristic c in characteristics) {
//                 bool value = await device.canSendWriteWithoutResponse;
//                       print("c.read(   =====>  ${value}");
//                     }
//                   });
//                 } on PlatformException catch (e) {
//                   if (e.code != 'already_connected') {
//                     rethrow;
//                   }
//                 } finally {
//                   services = await device.discoverServices();
//                 }
//                 setState(() {
//
//                   connectedDevice = device;
//
//                   services.forEach((service) {
//                     // do something with service
//                   });
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (
//                           context,
//                           ) =>
//                        BraceletConnected()));
//                 });
//
//               },
//             ),
//  ],
//         ),
//       );
//     }
//     return ListView(
//         padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
//         children: <Widget>[
//           Container(
//             padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
//             child: Image.asset("assets/images/connect02.png"),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 Text(
//                   'name_of_the_device'.tr,
//                   style: TextStyle(
//                     fontFamily: 'Poppins-SemiBold',
//                     fontSize: 13,
//                     color: const Color(0xffffffff),
//                     height: 1.0769230769230769,
//                   ),
//                   textHeightBehavior:
//                       TextHeightBehavior(applyHeightToFirstAscent: false),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//                 // SizedBox(
//                 //   width: MediaQuery.of(context).size.width * .3,
//                 // ),
//                 Spacer(),
//                 Text(
//                   Platform.isAndroid
//                       ? 'Android Device Info'
//                       : 'iOS Device Info',
//                   style: TextStyle(
//                     fontFamily: 'Poppins-SemiBold',
//                     fontSize: 13,
//                     color: const Color(0xffffffff),
//                     height: 1.0769230769230769,
//                   ),
//                   textHeightBehavior:
//                       TextHeightBehavior(applyHeightToFirstAscent: false),
//                   textAlign: TextAlign.center,
//                   softWrap: false,
//                 ),
//               ],
//             ),
//           ),
//           ...containers
//         ]);
//   }
//
//   final Map<Guid, List<int>> readValues = <Guid, List<int>>{};
//
//   List<ButtonTheme> _buildReadWriteNotifyButton(
//       BluetoothCharacteristic characteristic) {
//     print("reeeeeeeeeaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad");
//
//     List<ButtonTheme> buttons = <ButtonTheme>[];
//
//     final _writeController = TextEditingController();
//
//     if (characteristic.properties.read) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: TextButton(
//               child: const Text('READ', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 var sub = characteristic.value.listen((value) {
//                   setState(() {
//                     readValues[characteristic.uuid] = value;
//                   });
//                 });
//                 await characteristic.read();
//                 print("read bleutooth");
//                 sub.cancel();
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.write) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: ElevatedButton(
//               child: const Text('WRITE', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text("Write"),
//                         content: Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: TextField(
//                                 controller: _writeController,
//                               ),
//                             ),
//                           ],
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             child: const Text("Send"),
//                             onPressed: () {
//                               print("hhhhbbbbbbbbbbbbbbbbbbbb");
//                               characteristic.write(
//                                   utf8.encode(_writeController.value.text));
//                               Navigator.pop(context);
//                             },
//                           ),
//                           TextButton(
//                             child: const Text("Cancel"),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.notify) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: ElevatedButton(
//               child:
//                   const Text('NOTIFY', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 characteristic.value.listen((value) {
//                   setState(() {
//                     readValues[characteristic.uuid] = value;
//                   });
//                 });
//                 await characteristic.setNotifyValue(true);
//               },
//             ),
//           ),
//         ),
//       );
//     }
//
//     return buttons;
//   }
//
//   ListView _buildConnectDeviceView(readValues) {
//     print("salekhaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//     List<Widget> containers = <Widget>[];
//     List<BluetoothService> _services = [];
//
//     for (BluetoothService service in _services) {
//       List<Widget> characteristicsWidget = <Widget>[];
//
//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         characteristicsWidget.add(
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Text(characteristic.uuid.toString(),
//                         style: const TextStyle(fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     ..._buildReadWriteNotifyButton(characteristic),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text('Value: ${readValues[characteristic.uuid]}'),
//                   ],
//                 ),
//                 const Divider(),
//               ],
//             ),
//           ),
//         );
//       }
//       containers.add(
//         ExpansionTile(
//             title: Text(service.uuid.toString()),
//             children: characteristicsWidget),
//       );
//     }
//
//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }
//
//   ListView _buildView(readValues) {
//     BluetoothDevice? _connectedDevice;
//     if (_connectedDevice != null) {
//       return _buildConnectDeviceView(readValues);
//     }
//     return _buildListViewOfDevices();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Container(child: _buildView(readValues)),
//       // floatingActionButton: StreamBuilder<bool>(
//       //   stream: FlutterBluePlus.instance.isScanning,
//       //   initialData: false,
//       //   builder: (c, snapshot) {
//       //     if (snapshot.data!) {
//       //       return FloatingActionButton(
//       //         child: const Icon(Icons.stop),
//       //         onPressed: () => FlutterBluePlus.instance.stopScan(),
//       //         backgroundColor: Colors.red,
//       //       );
//       //     } else {
//       //       return FloatingActionButton(
//       //           child: const Icon(Icons.search),
//       //           onPressed: () => FlutterBluePlus.instance
//       //               .startScan(timeout: const Duration(seconds: 10)));
//       //     }
//       //   },
//       // ),
//     floatingActionButton: StreamBuilder<bool>(
//         stream: FlutterBluePlus.instance.isScanning,
//         initialData: false,
//         builder: (c, snapshot) {
//           if (snapshot.data!) {
//             return FloatingActionButton(
//               child: const Icon(Icons.stop),
//               onPressed: () => FlutterBluePlus.instance.stopScan(),
//               backgroundColor: Colors.red,
//             );
//           } else {
//             return FloatingActionButton(
//                 child: const Icon(Icons.search),
//                 onPressed: () => FlutterBluePlus.instance
//                     .startScan(timeout: const Duration(seconds: 4)));
//           }
//         },
//       ),
//
//     );
//   }
// }

/*
import 'dart:io';
import 'dart:math';

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
import '../../../../widgets.dart';
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
          // Container(
          //   padding: const EdgeInsets.fromLTRB(20, 20, 20, 70),
          //   child: Image.asset("assets/images/connect02.png"),
          // ),
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
        //  ...containers
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: RefreshIndicator(
        onRefresh: () => FlutterBluePlus.instance
            .startScan(timeout: const Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(const Duration(seconds: 2))
                    .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data ==
                            BluetoothDeviceState.connected) {
                          return ElevatedButton(
                            child: const Text('OPEN'),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                      builder: (
                          context,
                          ) =>
                       BraceletConnected()));
                            },
                          );
                        }
                        return Text(snapshot.data.toString());
                      },
                    ),
                  ))
                      .toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.instance.scanResults,
                initialData: const [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (r) => GestureDetector(onTap: (){


                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        r.device.connect();
                        return DeviceScreen(device: r.device);
                      }));
                    },
                      child: Column(
                        children: [
                          Text(r.device.name),
                          Text(r.device.type.name),
                          Text(r.device.id.toString()),
                          Text(r.advertisementData.connectable.toString()),
                          Text(r.advertisementData.localName.toString()),
                          Text(r.advertisementData.serviceUuids.toString()),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
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
                    .startScan(timeout: const Duration(seconds: 4)));
          }
        },
      ),

    );
  }
}
class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key? key, required this.device}) : super(key: key);

  final BluetoothDevice device;

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List _buildServiceTiles(List<BluetoothService> services) {
    return services
        .map(
          (s) => ServiceTile(
        service: s,
        characteristicTiles: s.characteristics
            .map(
              (c) => CharacteristicTile(
            characteristic: c,
            onReadPressed: () => c.read(),
            onWritePressed: () async {
              await c.write(_getRandomBytes(), withoutResponse: true);
              await c.read();
            },
            onNotificationPressed: () async {
              await c.setNotifyValue(!c.isNotifying);
              await c.read();
            },
            descriptorTiles: c.descriptors
                .map(
                  (d) => DescriptorTile(
                descriptor: d,
                onReadPressed: () => d.read(),
                onWritePressed: () => d.write(_getRandomBytes()),
              ),
            )
                .toList(),
          ),
        )
            .toList(),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) {
              VoidCallback? onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return TextButton(
                  onPressed: onPressed,
                  child: Text(
                    text,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button
                        ?.copyWith(color: Colors.white),
                  ));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<List<BluetoothDevice>>(
              stream: Stream.periodic(const Duration(seconds: 2))
                  .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
              initialData: const [],
              builder: (c, snapshot) => Column(
                children: snapshot.data!
                    .map((d) => ListTile(
                  title: Text(d.name),
                  subtitle: Text(d.id.toString()),
                  trailing: StreamBuilder<BluetoothDeviceState>(
                    stream: d.state,
                    initialData: BluetoothDeviceState.disconnected,
                    builder: (c, snapshot) {
                      if (snapshot.data ==
                          BluetoothDeviceState.connected) {
                        return ElevatedButton(
                          child: const Text('OPEN'),
                          onPressed: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DeviceScreen(device: d))),
                        );
                      }
                      return Text(snapshot.data.toString());
                    },
                  ),
                ))
                    .toList(),
              ),
            ),
            StreamBuilder<int>(
              stream: device.mtu,
              initialData: 0,
              builder: (c, snapshot) => ListTile(
                title: const Text('MTU Size'),
                subtitle: Text('${snapshot.data} bytes'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => device.requestMtu(223),
                ),
              ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: const [],
              builder: (c, snapshot) {
                return Column(children: [] //_buildServiceTiles(snapshot.data!),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Stream<int> rssiStream() async* {
    var isConnected = true;
    final subscription = device.state.listen((state) {
      isConnected = state == BluetoothDeviceState.connected;
    });
    while (isConnected) {
      yield await device.readRssi();
      await Future.delayed(const Duration(seconds: 1));
    }
    subscription.cancel();
    // Device disconnected, stopping RSSI stream
  }
}*/

/*import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/BraceletConnected.dart';

import '../../../../sensor.dart';
import '../../../../widgets.dart';
import '../../home_page.dart';

class FlutterBlueApp extends StatelessWidget {
  const FlutterBlueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.lightBlue,
      home: StreamBuilder<BluetoothState>(
          stream: FlutterBluePlus.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
            final state = snapshot.data;
            if (state == BluetoothState.on) {
              return  FindDevicesScreen();
            }
            return BluetoothOffScreen(state: state);
          }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key? key, this.state}) : super(key: key);

  final BluetoothState? state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle2
                  ?.copyWith(color: Colors.white),
            ),
            ElevatedButton(
              child: const Text('TURN ON'),
              onPressed: Platform.isAndroid
                  ? () => FlutterBluePlus.instance.turnOn()
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Devices'),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            FlutterBluePlus.instance.startScan(timeout: Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: Stream.periodic(Duration(seconds: 2))
                    .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map((d) => ListTile(
                    title: Text(d.name),
                    subtitle: Text(d.id.toString()),
                    trailing: StreamBuilder<BluetoothDeviceState>(
                      stream: d.state,
                      initialData: BluetoothDeviceState.disconnected,
                      builder: (c, snapshot) {
                        if (snapshot.data ==
                            BluetoothDeviceState.connected) {}
                        return Text(snapshot.data.toString());
                      },
                    ),
                  ))
                      .toList(),
                ),
              ),
              StreamBuilder<List<ScanResult>>(
                stream: FlutterBluePlus.instance.scanResults,
                initialData: [],
                builder: (c, snapshot) => Column(
                  children: snapshot.data!
                      .map(
                        (r) => ScanResultTile(
                      result: r,
                      onTap: () => Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        r.device.connect();
                        return SensorPage(device: r.device);
                      })),
                    ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: FlutterBluePlus.instance.isScanning,
        initialData: false,
        builder: (c, snapshot) {
          if (snapshot.data!) {
            return FloatingActionButton(
              child: Icon(Icons.stop),
              onPressed: () => FlutterBluePlus.instance.stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
                child: Icon(Icons.search),
                onPressed: () => FlutterBluePlus.instance
                    .startScan(timeout: Duration(seconds: 4)));
          }
        },
      ),
    );
  }
}*/

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:knowplesy/app/widget/widget_home/widget_home_page1.dart';
import '../../../../app/util/app_colors.dart';
import '../../../controllers/seizure_controller/seizure_controller.dart';
import '../../home/home_page/home_page.dart';
import '../../home_page.dart';
import 'BraceletConnected.dart';

class BluetoothPage extends StatefulWidget {
  final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  final Map<Guid, List<int>> readValues = <Guid, List<int>>{};

  @override
  BluetoothPageState createState() => BluetoothPageState();
}

class BluetoothPageState extends State<BluetoothPage> {
  SeizureController controller = Get.find<SeizureController>();
  String allData = "";
  final _writeController = TextEditingController();
  BluetoothDevice? _connectedDevice;
  List<BluetoothService> _services = [];
  RxString heart = "0".obs;

  _addDeviceTolist(final BluetoothDevice device) {
    if (!widget.devicesList.contains(device)) {
      setState(() {
        widget.devicesList.add(device);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    widget.flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });
    widget.flutterBlue.startScan();
  }

  ListView _buildListViewOfDevices() {
    List<Widget> containers = <Widget>[];
    for (BluetoothDevice device in widget.devicesList) {
      containers.add(
        SizedBox(
          height: 50,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(device.name == '' ? '(unknown device)' : device.name),
                    Text(device.id.toString()),
                  ],
                ),
              ),
              TextButton(
                child: const Text(
                  'Connect',
                  style: TextStyle(color: Colors.orange),
                ),
                onPressed: () async {
                  widget.flutterBlue.stopScan();
                  try {

                    await device.connect();
                 controller.device=device;

                  } on PlatformException catch (e) {
                    if (e.code != 'already_connected') {
                      rethrow;
                    }
                  } finally {
                    _services = await device.discoverServices();

                  }
               //   Get.to(HomePage());
                 setState(() {
                 controller.dataBluetooth(service: _services,dev: device);
                 Get.to(BraceletConnected());

                   });
                 //  setState(() {
                   // _connectedDevice = device;
                  //  });
                },
              ),
            ],
          ),
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

  List<ButtonTheme> _buildReadWriteNotifyButton(
      BluetoothCharacteristic characteristic) {
    List<ButtonTheme> buttons = <ButtonTheme>[];

    if (characteristic.properties.read) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              child: const Text('READ', style: TextStyle(color: Colors.orange)),
              onPressed: () async {
                var sub = characteristic.value.listen((value) {
                  setState(() {
                    widget.readValues[characteristic.uuid] = value;
                  });
                });
                await characteristic.read();
                sub.cancel();
              },
            ),
          ),
        ),
      );
    }
    if (characteristic.properties.write) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              child: const Text('WRITE', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Write"),
                        content: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _writeController,
                              ),
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Send"),
                            onPressed: () {
                              characteristic.write(
                                  utf8.encode(_writeController.value.text));
                              var encoded =
                                  utf8.encode(_writeController.value.text);
                              log("encode $encoded");
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text("Cancel"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    });
              },
            ),
          ),
        ),
      );
    }
    if (characteristic.properties.notify) {
      buttons.add(
        ButtonTheme(
          minWidth: 10,
          height: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              child:
                  const Text('NOTIFY', style: TextStyle(color: Colors.white)),
              onPressed: () async {
                characteristic.value.listen((value) async {
                  print(" => $value");
                  setState(() {
                    widget.readValues[characteristic.uuid] = value;
                    var decode = utf8.decode(value);
                    log("decode $decode");
                  });
                });
                await characteristic.setNotifyValue(true);
              },
            ),
          ),
        ),
      );
    }

    return buttons;
  }

  ListView _buildConnectDeviceView() {
    List<Widget> containers = <Widget>[];

    for (BluetoothService service in _services) {
      List<Widget> characteristicsWidget = <Widget>[];

      for (BluetoothCharacteristic characteristic in service.characteristics) {
        characteristicsWidget.add(
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(characteristic.uuid.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    ..._buildReadWriteNotifyButton(characteristic),
                  ],
                ),
                Container(
                    height: 200,
                    child: StreamBuilder(
                        stream: characteristic.value,
                        builder: (context, data) {
                          var bb = utf8.decode(data.data ?? []);

                          allData = allData + bb;
                          print("0" * 50);
                          print("allData => $allData");
                          print("1" * 50);
                          //  RegExp heart = RegExp(r'PPG\":\[\"[0-9]+\.[0-9]+');
                          //   RegExp temp = RegExp(r'TEMP\":\[\"[0-9]+\.[0-9]+');

                          //  RegExpMatch? rege =
                          //     heart.firstMatch(allData);
                          //  String? vbbb = rege
                          //       ?.group(0)
                          //       ?.split(":")
                          //      ?.last
                          //     ?.replaceAll("[", "")
                          //  ?.replaceAll("]", "")
                          //   .replaceAll("\"", "") ??
                          //   "";

                          // print(
                          //     "heart  $vbbb");
                          // RegExpMatch? regTemp =
                          //     temp.firstMatch(allData);
                          // String? cc = regTemp
                          //         ?.group(0)
                          //         ?.split(":").last
                          //         ?.replaceAll("[", "")
                          //         ?.replaceAll("]", "")
                          //         .replaceAll("\"", "") ??
                          //     "";
                          //
                          // print(
                          //     "temperature  ${cc}");

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: CircleAvatar(
                                      backgroundImage:
                                          AssetImage("assets/images/herat.png"),
                                      backgroundColor: Colors.deepPurple,
                                      maxRadius: 35,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "heart",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 80,
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "${controller.temperature}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "assets/images/temperature.png"),
                                    backgroundColor: Colors.deepPurple,
                                    maxRadius: 35,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Temperature",
                                    style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 50,
                                    width: 80,
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        "hhhh",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          );
                        })),
                Row(
                  children: <Widget>[
                    Text('Value: ${widget.readValues[characteristic.uuid]}'),
                  ],
                ),
                const Divider(),
              ],
            ),
          ),
        );
      }
      containers.add(
        ExpansionTile(
            title: Text(service.uuid.toString()),
            children: characteristicsWidget),
      );
    }

    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        ...containers,
      ],
    );
  }

  ListView _buildView() {
    if (_connectedDevice != null) {
      return _buildConnectDeviceView();
    }
    return _buildListViewOfDevices();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: _buildView(),
      );
}
