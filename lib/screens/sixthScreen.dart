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
          child: Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 20, top: 52),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thank you!',
                        style: boldOnes,
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                      Text(
                        'Thank you for registering with Company.\n Please complete your registration to be activated ',
                        style: normalOnes,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 515,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 55,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Go to Profile",
                          style: buttonTextOnes,
                        ),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: const Color(0xFF58BE3F),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}