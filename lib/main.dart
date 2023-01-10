import 'dart:isolate';
import 'dart:math';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:knowplesy/app/util/app_colors.dart';
import 'package:knowplesy/presentation/bindings/bindings.dart';
import 'package:knowplesy/presentation/pages/home_page.dart';
import 'package:knowplesy/presentation/pages/login_page/BleutoothScreen/ConnectBleutoothScreen.dart';
import 'package:knowplesy/presentation/pages/login_page/login_page.dart';
import 'package:knowplesy/presentation/pages/login_page/reset_password/reset_password.dart';
import 'package:knowplesy/translation/trans.dart';
import 'package:knowplesy/world_language.dart';
import 'app/config/app_routing.dart';
import 'app/storage/account_info_storage.dart';
import 'app/storage/secure_storage.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';

import 'localNotif.dart';

printHello() async {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");

  LocalNotificationService service = LocalNotificationService();
  service.intialze();
  await service.showNotification(
      id: 0,
      title: "Panodol reminder",
      body:
          "if you dont cancel the alert the following caregivers will be notified");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  String? lan = SecureStorage.readSecureData('lan');
  if (lan != null) {
    if (lan == "en") {
      var locale = Locale('en', 'US');

      Get.updateLocale(locale);
    } else {
      var locale = Locale('fr', 'Fr');
      Get.updateLocale(locale);
    }
  }
  WidgetsFlutterBinding.ensureInitialized();

  await AndroidAlarmManager.initialize();
  runApp(MyApp());
  final int helloAlarmID = 0;
  // await AndroidAlarmManager.periodic(
  //     const Duration(minutes: 1), helloAlarmID, printHello);
  // await AndroidAlarmManager.oneShotAt(
  //     DateTime.now().add(const Duration(seconds: 10)), 123, printHello,
  //     alarmClock: true);
}

class MyApp extends StatelessWidget {
  int _counter = 0;
  late final LocalNotificationService service;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("*" * 10);
    print(SecureStorage.readSecureData('token') != null);
    print(SecureStorage.readSecureData('token'));
    print("*" * 10);

    return GetMaterialApp(
      // translations: WorldLanguage(),
      //Language class from world_languages.dart
      // locale: Locale('fr', 'FR'),
      //
      // // translations will be displayed in that locale
      // fallbackLocale: Locale('fr', 'FR'),
      // // specify the fallback locale in case an invalid locale is selected.
      locale: LocalizationService.locale,
      translations: LocalizationService(),
      fallbackLocale: LocalizationService.fallbackLocale,

      debugShowCheckedModeBanner: false,
      initialBinding: AllBindings(),
      home: AnimatedSplashScreen(
        duration: 3000,
        splashIconSize: 75,
        splash: Image.asset("assets/images/logo_knowlepsy.png"),
        nextScreen: SecureStorage.readSecureData('token') != null
            ? HomePage()
            : LoginPage(),
        //nextScreen: HomePage(),

        splashTransition: SplashTransition.slideTransition,
        backgroundColor: AppColors.primaryColor,
      ),
      getPages: AppRouting.pages,
    );
  }
}

// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
//
// import 'widgets.dart';
//
// void main() {
//   runApp(const FlutterBlueApp());
// }
//
// class FlutterBlueApp extends StatelessWidget {
//   const FlutterBlueApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       color: Colors.lightBlue,
//       home: StreamBuilder<BluetoothState>(
//           stream: FlutterBluePlus.instance.state,
//           initialData: BluetoothState.unknown,
//           builder: (c, snapshot) {
//             final state = snapshot.data;
//             if (state == BluetoothState.on) {
//               return const FindDevicesScreen();
//             }
//             return BluetoothOffScreen(state: state);
//           }),
//     );
//   }
// }
//
// class BluetoothOffScreen extends StatelessWidget {
//   const BluetoothOffScreen({Key? key, this.state}) : super(key: key);
//
//   final BluetoothState? state;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.lightBlue,
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             const Icon(
//               Icons.bluetooth_disabled,
//               size: 200.0,
//               color: Colors.white54,
//             ),
//             Text(
//               'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
//               style: Theme.of(context)
//                   .primaryTextTheme
//                   .subtitle2
//                   ?.copyWith(color: Colors.white),
//             ),
//             ElevatedButton(
//               child: const Text('TURN ON'),
//               onPressed: Platform.isAndroid
//                   ? () => FlutterBluePlus.instance.turnOn()
//                   : null,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FindDevicesScreen extends StatelessWidget {
//   const FindDevicesScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Find Devices'),
//         actions: [
//           ElevatedButton(
//             child: const Text('TURN OFF'),
//             style: ElevatedButton.styleFrom(
//               primary: Colors.black,
//               onPrimary: Colors.white,
//             ),
//             onPressed: Platform.isAndroid
//                 ? () => FlutterBluePlus.instance.turnOff()
//                 : null,
//           ),
//         ],
//       ),
//       body: RefreshIndicator(
//         onRefresh: () => FlutterBluePlus.instance
//             .startScan(timeout: const Duration(seconds: 4)),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               StreamBuilder<List<BluetoothDevice>>(
//                 stream: Stream.periodic(const Duration(seconds: 2))
//                     .asyncMap((_) => FlutterBluePlus.instance.connectedDevices),
//                 initialData: const [],
//                 builder: (c, snapshot) => Column(
//                   children: snapshot.data!
//                       .map((d) => ListTile(
//                             title: Text(d.name),
//                             subtitle: Text(d.id.toString()),
//                             trailing: StreamBuilder<BluetoothDeviceState>(
//                               stream: d.state,
//                               initialData: BluetoothDeviceState.disconnected,
//                               builder: (c, snapshot) {
//                                 if (snapshot.data ==
//                                     BluetoothDeviceState.connected) {
//                                   return ElevatedButton(
//                                     child: const Text('OPEN'),
//                                     onPressed: () => Navigator.of(context).push(
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 DeviceScreen(device: d))),
//                                   );
//                                 }
//                                 return Text(snapshot.data.toString());
//                               },
//                             ),
//                           ))
//                       .toList(),
//                 ),
//               ),
//               StreamBuilder<List<ScanResult>>(
//                 stream: FlutterBluePlus.instance.scanResults,
//                 initialData: const [],
//                 builder: (c, snapshot) => Column(
//                   children: snapshot.data!
//                       .map(
//                         (r) => ScanResultTile(
//                           result: r,
//                           onTap: () => Navigator.of(context)
//                               .push(MaterialPageRoute(builder: (context) {
//                             r.device.connect();
//                             return DeviceScreen(device: r.device);
//                           })),
//                         ),
//                       )
//                       .toList(),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: StreamBuilder<bool>(
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
//     );
//   }
// }
//
// class DeviceScreen extends StatelessWidget {
//   const DeviceScreen({Key? key, required this.device}) : super(key: key);
//
//   final BluetoothDevice device;
//
//   List<int> _getRandomBytes() {
//     final math = Random();
//     return [
//       math.nextInt(255),
//       math.nextInt(255),
//       math.nextInt(255),
//       math.nextInt(255)
//     ];
//   }
//
//   List<Widget> _buildServiceTiles(List<BluetoothService> services) {
//     return services
//         .map(
//           (s) => ServiceTile(
//             service: s,
//             characteristicTiles: s.characteristics
//                 .map(
//                   (c) => CharacteristicTile(
//                     characteristic: c,
//                     onReadPressed: () => c.read(),
//                     onWritePressed: () async {
//                       await c.write(
//                           utf8
//                               .encode('{"request":"data", "action":"GET"}')
//                               .toList(),
//                           withoutResponse: true);
//                       print(
//                           "write    ${utf8.encode('{"request":"data", "action":"GET"}')}");
//                       print("read     ${utf8.decode([
//                             123,
//                             34,
//                             114,
//                             101,
//                             113,
//                             117,
//                             101,
//                             115,
//                             116,
//                             34,
//                             58,
//                             34,
//                             100,
//                             97,
//                             116,
//                             97,
//                             34,
//                             44,
//                             32,
//                             34,
//                             97,
//                             99,
//                             116,
//                             105,
//                             111,
//                             110,
//                             34,
//                             58,
//                             34,
//                             71,
//                             69,
//                             84,
//                             34,
//                             125
//                           ])}");
//
//                       if (c.properties.read) {
//                         List<int> value = await c.read();
//                         print("value  $value");
//                       }
//                     },
//                     onNotificationPressed: () async {
//                       await c.setNotifyValue(!c.isNotifying);
//                       await c.read();
//                     },
//                     descriptorTiles: c.descriptors
//                         .map(
//                           (d) => DescriptorTile(
//                             descriptor: d,
//                             onReadPressed: () => d.read(),
//                             onWritePressed: () => d.write(
//                               utf8
//                                   .encode('{"request":"data", "action":"GET"}')
//                                   .toList(),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 )
//                 .toList(),
//           ),
//         )
//         .toList();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(device.name),
//         actions: <Widget>[
//           StreamBuilder<BluetoothDeviceState>(
//             stream: device.state,
//             initialData: BluetoothDeviceState.connecting,
//             builder: (c, snapshot) {
//               VoidCallback? onPressed;
//               String text;
//               switch (snapshot.data) {
//                 case BluetoothDeviceState.connected:
//                   onPressed = () => device.disconnect();
//                   text = 'DISCONNECT';
//                   break;
//                 case BluetoothDeviceState.disconnected:
//                   onPressed = () => device.connect();
//                   text = 'CONNECT';
//                   break;
//                 default:
//                   onPressed = null;
//                   text = snapshot.data.toString().substring(21).toUpperCase();
//                   break;
//               }
//               return TextButton(
//                   onPressed: onPressed,
//                   child: Text(
//                     text,
//                     style: Theme.of(context)
//                         .primaryTextTheme
//                         .button
//                         ?.copyWith(color: Colors.white),
//                   ));
//             },
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             StreamBuilder<BluetoothDeviceState>(
//               stream: device.state,
//               initialData: BluetoothDeviceState.connecting,
//               builder: (c, snapshot) => ListTile(
//                 leading: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     snapshot.data == BluetoothDeviceState.connected
//                         ? const Icon(Icons.bluetooth_connected)
//                         : const Icon(Icons.bluetooth_disabled),
//                     snapshot.data == BluetoothDeviceState.connected
//                         ? StreamBuilder<int>(
//                             stream: rssiStream(),
//                             builder: (context, snapshot) {
//                               return Text(
//                                   snapshot.hasData ? '${snapshot.data}dBm' : '',
//                                   style: Theme.of(context).textTheme.caption);
//                             })
//                         : Text('', style: Theme.of(context).textTheme.caption),
//                   ],
//                 ),
//                 title: Text(
//                     'Device is ${snapshot.data.toString().split('.')[1]}.'),
//                 subtitle: Text('${device.id}'),
//                 trailing: StreamBuilder<bool>(
//                   stream: device.isDiscoveringServices,
//                   initialData: false,
//                   builder: (c, snapshot) => IndexedStack(
//                     index: snapshot.data! ? 1 : 0,
//                     children: <Widget>[
//                       IconButton(
//                         icon: const Icon(Icons.refresh),
//                         onPressed: () => device.discoverServices(),
//                       ),
//                       const IconButton(
//                         icon: SizedBox(
//                           child: CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation(Colors.grey),
//                           ),
//                           width: 18.0,
//                           height: 18.0,
//                         ),
//                         onPressed: null,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             StreamBuilder<int>(
//               stream: device.mtu,
//               initialData: 0,
//               builder: (c, snapshot) => ListTile(
//                 title: const Text('MTU Size'),
//                 subtitle: Text('${snapshot.data} bytes'),
//                 trailing: IconButton(
//                   icon: const Icon(Icons.edit),
//                   onPressed: () => device.requestMtu(223),
//                 ),
//               ),
//             ),
//             StreamBuilder<List<BluetoothService>>(
//               stream: device.services,
//               initialData: const [],
//               builder: (c, snapshot) {
//                 return Column(
//                   children: _buildServiceTiles(snapshot.data!),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Stream<int> rssiStream() async* {
//     var isConnected = true;
//     final subscription = device.state.listen((state) {
//       isConnected = state == BluetoothDeviceState.connected;
//     });
//     while (isConnected) {
//       yield await device.readRssi();
//       await Future.delayed(const Duration(seconds: 1));
//     }
//     subscription.cancel();
//     // Device disconnected, stopping RSSI stream
//   }
// }
