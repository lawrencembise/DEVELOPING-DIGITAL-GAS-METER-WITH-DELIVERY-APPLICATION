// ignore: file_names

import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gas delivery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
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
                    Row(
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
                          Container(
                            alignment: Alignment.center,
                            color: themeColor,
                            height: 42,
                            width: 152,
                            child: Text(
                              "Cash On Delivery",
                              style: buttonTextOnes,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColor)),
                            height: 42,
                            width: 152,
                            child: Text(
                              "Mobile Money",
                              style: greenBar,
                            ),
                          )
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
                      Text(
                        'First name',
                        style: tinyOnes,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const SizedBox(height: 9),
                      const Divider(
                        height: 1,
                        color: Color(0xFF58BE3F),
                        thickness: 3,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 39),
                      Text(
                        'Last name',
                        style: tinyOnes,
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 39),
                      Text(
                        'Home address',
                        style: tinyOnes,
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 39),
                      Text(
                        'Password',
                        style: tinyOnes,
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                        height: 1,
                        color: Colors.grey,
                        endIndent: 20,
                      ),
                      const SizedBox(height: 15),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  width: double.infinity,
                  height: 55,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Continue ",
                          style: normalOnes,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.grey[300],
                          size: 33,
                        )
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                            color: myGrey,
                            offset: const Offset(0, 10),
                            blurRadius: 15.0)
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}