// ignore: file_names

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/homeScreen.dart';
import 'package:mtungi_chap_chap/widgets/toggleButton.dart';


import '../main.dart';
import '../global/userdata.dart';
import 'ChatPage.dart';
import 'SelectBondedDevicePage.dart';

class SettingsScreen extends StatefulWidget {

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  String myGroupValue = "unSelected";

  TextEditingController firstNameTextEditingController =
      TextEditingController();
  TextEditingController lastNameTextEditingController = TextEditingController();
  TextEditingController homeAddressTextEditingController =
      TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  Timer? _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  bool _autoAcceptPairingRequests = false;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if ((await FlutterBluetoothSerial.instance.isEnabled) ?? false) {
        return false;
      }
      await Future.delayed(Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address!;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name!;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 45,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 27.8,
                          ),
                          Icon(
                            Icons.arrow_back,
                            color: themeColor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "BACK",
                            style: greenBar,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    CircleAvatar(
                        child: const Icon(Icons.camera_alt_outlined, size: 40),
                        foregroundColor: Colors.grey[500],
                        maxRadius: 71,
                        backgroundColor: Colors.grey[300]),
                    const SizedBox(
                      height: 50.9,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  myGroupValue = "Mobile Money";
                                });
                              },
                              child: ToggleButton(
                                buttonText: "Mobile Money",
                                groupValue: myGroupValue,
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  myGroupValue = "Cash on Delivery";
                                });
                              },
                              child: ToggleButton(
                                buttonText: "Cash on Delivery",
                                groupValue: myGroupValue,
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 43,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 21),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: firstNameTextEditingController,
                        cursorColor: themeColor,
                        decoration: InputDecoration(
                          fillColor: themeColor,
                          focusColor: themeColor,
                          labelText: "First name",
                          labelStyle: normalOnes,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: themeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: myGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 39),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: lastNameTextEditingController,
                        cursorColor: themeColor,
                        decoration: InputDecoration(
                          fillColor: themeColor,
                          focusColor: themeColor,
                          labelText: "Last Name",
                          labelStyle: normalOnes,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: themeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: myGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 39),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: homeAddressTextEditingController,
                        cursorColor: themeColor,
                        decoration: InputDecoration(
                          fillColor: themeColor,
                          focusColor: themeColor,
                          labelText: "Home address",
                          labelStyle: normalOnes,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: themeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: myGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 39),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: passwordTextEditingController,
                        obscureText: true,
                        cursorColor: themeColor,
                        decoration: InputDecoration(
                          fillColor: themeColor,
                          focusColor: themeColor,
                          labelText: "Password",
                          labelStyle: normalOnes,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: themeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: myGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 39),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: confirmPasswordTextEditingController,
                        obscureText: true,
                        cursorColor: themeColor,
                        decoration: InputDecoration(
                          fillColor: themeColor,
                          focusColor: themeColor,
                          labelText: "Confirm Password",
                          labelStyle: normalOnes,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: themeColor),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: myGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              SwitchListTile(
                title: Text('Enable Bluetooth', style: normalOnes),
                activeColor: themeColor,
                value: _bluetoothState.isEnabled,
                onChanged: (bool value) {
                  // Do the request and update with the true value then
                  future() async {
                    // async lambda seems to not working
                    if (value) {
                      await FlutterBluetoothSerial.instance.requestEnable();
                    } else {
                      await FlutterBluetoothSerial.instance.requestDisable();
                    }
                  }

                  future().then((_) {
                    setState(() {});
                  });
                },
              ),
              ListTile(
                title: Text(
                  'Bluetooth status',
                  style: normalOnes,
                ),
                subtitle: Text(
                  _bluetoothState.toString(),
                  style: tinyOnes,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final BluetoothDevice? selectedDevice =
                      await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SelectBondedDevicePage(checkAvailability: false);
                      },
                    ),
                  );

                  if (selectedDevice != null) {
                    print('Connect -> selected ' + selectedDevice.address);
                    _startChat(context, selectedDevice);
                  } else {
                    print('Connect -> no device selected');
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Connect to paired device to chat",
                            style: buttonTextOnes,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: myGrey,
                              offset: const Offset(0, 10),
                              blurRadius: 15.0)
                        ]),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (firstNameTextEditingController.text.length <= 4) {
                    _scaffoldkey.currentState!.showSnackBar(SnackBar(
                        content:
                            Text('First Name should be minimum 4 characters')));
                    return;
                  }
                  if (passwordTextEditingController.text.length <= 4) {
                    _scaffoldkey.currentState!.showSnackBar(SnackBar(
                        content:
                            Text('Password should be minimum 4 characters')));
                  }
                  Map userDetails = {
                    "password": passwordTextEditingController.text,
                    "name": firstNameTextEditingController.text,
                  };

                  dbRef.child(userdata?.read("uid")).set(userDetails).then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen()),
                        (route) => false);
                  }).onError((error, stackTrace) {
                    _scaffoldkey.currentState!.showSnackBar(
                        SnackBar(content: Text('${error.toString()}')));
                  });
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Save",
                            style: buttonTextOnes,
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: myGrey,
                              offset: const Offset(0, 10),
                              blurRadius: 15.0)
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _startChat(BuildContext context, BluetoothDevice server) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return ChatPage(server: server);
      },
    ),
  );
}
