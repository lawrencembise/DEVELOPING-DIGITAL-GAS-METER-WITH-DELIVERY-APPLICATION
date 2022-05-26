import 'dart:async';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/sidebarScreen.dart';
import 'package:mtungi_chap_chap/widgets/myDashboard.dart';
import 'package:mtungi_chap_chap/widgets/statsWidget.dart';
import 'package:mtungi_chap_chap/main.dart';
import '../global/userdata.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  String user = userdata?.read("uid");

  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;
  Timer? timer;

  bool isLoading = false;

  late AnimationController progressController;
  late Animation<double> tempAnimation;
  late Animation<double> humidityAnimation;


  var sidebarHidden = true;
  String newvalue = "x";

  @override
  void initState() {
    super.initState();
    sidebarAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    sidebarAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: sidebarAnimationController,
      curve: Curves.easeInOut,
    ));
    fadeAnimation = Tween<double>(begin: 0.0, end: 0.1).animate(
      CurvedAnimation(
        parent: sidebarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    dbRef.child('${user}').once().then((DataSnapshot snapshot) {
      double temp = snapshot.value['level'];
      double humidity = snapshot.value['leakage'];

      isLoading = true;
      _DashboardInit(temp, humidity);
    });  }

  _DashboardInit(double temp, double humid) {
    progressController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000)); //5s

    tempAnimation =
    Tween<double>(begin: 0, end: temp).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    humidityAnimation =
    Tween<double>(begin: 0, end: humid).animate(progressController)
      ..addListener(() {
        setState(() {});
      });

    progressController.forward();
  }


  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading ? Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sidebarHidden = !sidebarHidden;
                          });
                          sidebarAnimationController.forward();
                        },
                        child: CircleAvatar(
                          radius: 25,
                          child: const Icon(Icons.menu, color: Colors.white),
                          backgroundColor: themeColor,
                        ),
                      ),
                      const SizedBox(
                        width: 22,
                      ),
                      Text(
                        "Home",
                        style: greenBar,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  Expanded(
                    child:  MyDashboard(isLoading: isLoading, tempAnimation: tempAnimation, humidityAnimation: humidityAnimation),
                  ),
                  StatsWidget(),
                  const SizedBox(
                    height: 46,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "ORDER GAS",
                        style: buttonTextOnes,
                      ),
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationController.reverse();
                      },
                      child: Container(
                        color: const Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  SlideTransition(
                      child: SafeArea(child: Sidebar(), bottom: false),
                      position: sidebarAnimation),
                ],
              ),
            ),
          ],
        ): Center(
          child: Text(
            'Loading...',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ))
      );

  }

  // checkForNewValue() {
  //   setState(() {
  //     newvalue = Random().nextInt(100).toString();
  //   });
  //   print(newvalue);
  // }
}
