import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/sidebarScreen.dart';
import 'package:mtungi_chap_chap/widgets/days_left.dart';
import 'package:mtungi_chap_chap/widgets/gas_level.dart';
import 'package:mtungi_chap_chap/widgets/leakage_level.dart';
import 'package:mtungi_chap_chap/widgets/statsWidget.dart';
import '../global/userdata.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;
  Timer? timer;

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
    // timer = Timer.periodic(Duration(seconds: 15),(Timer t) => checkForNewValue());
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
        body: Stack(
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
                    child: Row(
                      children: [
                        Expanded(
                          child: GasLevel(),
                        ),
                        Expanded(
                          child: LeakageLevel(),
                        ),
                        Expanded(
                          child: DaysLeft(),
                        ),
                      ],
                    ),
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
        ),
      ),
    );
  }

  // checkForNewValue() {
  //   setState(() {
  //     newvalue = Random().nextInt(100).toString();
  //   });
  //   print(newvalue);
  // }
}
