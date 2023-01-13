import 'dart:async';
import 'dart:convert' show utf8;

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'homeui.dart';

class SensorPage extends StatefulWidget {
  const SensorPage({Key? key, this.device}) : super(key: key);
  final BluetoothDevice? device;

  @override
  _SensorPageState createState() => _SensorPageState();
}

class _SensorPageState extends State<SensorPage> {
  String service_uuid = "00001800-0000-1000-8000-00805f9b34fb";
  String charaCteristic_uuid = "00002a00-0000-1000-8000-00805f9b34fb";
  bool? isReady;
  Stream<List<int>>? stream;
  List? _temphumidata;
  int _temp = 0;
 int  _heart = 0;

  @override
  void initState() {
    super.initState();
    isReady = false;
    connectToDevice();
  }

  void dispose() {
    widget.device!.disconnect();
    super.dispose();
  }

  connectToDevice() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    new Timer(const Duration(seconds: 15), () {
      if (!isReady!) {
        disconnectFromDevice();
        _pop();
      }
    });

    await widget.device!.connect();
    discoverServices();
  }

  disconnectFromDevice() {
    if (widget.device == null) {
      _pop();
      return;
    }

    widget.device!.disconnect();
  }

  discoverServices() async {
    if (widget.device == null) {
      _pop();
      return;
    }

    List<BluetoothService> services = await widget.device!.discoverServices();
    services.forEach((service) {
      print("service_uuid  ${service_uuid}");
      print("charaCteristic_uuid  ${charaCteristic_uuid}");

      if (service.uuid.toString() == service_uuid) {
        service.characteristics.forEach((characteristic) {
          if (characteristic.uuid.toString() == charaCteristic_uuid) {
            characteristic.setNotifyValue(!characteristic.isNotifying);
            stream = characteristic.value;

            setState(() {
              isReady = true;
            });
          }
        });
      }
    });

    if (!isReady!) {
      print("yes");
      _pop();
    }
  }
  Future<bool> _onWillPop()async {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurs',
          style: TextStyle(color: Colors.blue),
        ),
        content: Text("message"),
        actions: <Widget>[
          ElevatedButton(
              child: Text('No'), onPressed: () => Navigator.of(context).pop(false)),
          ElevatedButton(      child: Text('Yes'), onPressed: () => Navigator.of(context).pop(true)),
        ],
      ),
    );
    return false;

  }

  _pop() {
    Navigator.of(context).pop(true);
  }

  String _dataParser(List<int> dataFromDevice) {
    return utf8.decode(dataFromDevice);
  }



 @override
Widget build(BuildContext context) {
  return WillPopScope(
    onWillPop:_onWillPop,
    child: Scaffold(
      appBar: AppBar(
        title: Text('dht11 Sensor'),
      ),
      body: Container(
          child: !isReady!
              ? Center(
            child: Text(
              "Waiting...",
              style: TextStyle(fontSize: 24, color: Colors.red),
            ),
          )
              : Container(
            child: StreamBuilder<List<int>>(
              stream: stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<int>> snapshot) {
                if (snapshot.hasError)
                  return Text('Error: ${snapshot.error}');

                if (snapshot.connectionState ==
                    ConnectionState.active) {
                  // geting data from bluetooth
                  var currentValue = _dataParser(snapshot.data!);
                  _temphumidata = currentValue.split(",");
                  if (_temphumidata![0] != "nan") {
                    _temp = _temphumidata![0];
                  }
                  if (_temphumidata![1] != "nan") {
                    _heart = _temphumidata![1];
                  }

                  return HomeUI(
                    humidity: _heart,
                    temperature: _temp,
                  );
                } else {
                  return Text('Check the stream');
                }
              },
            ),
          )),
    ),
  );
}}
