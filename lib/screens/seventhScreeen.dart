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
                      height: 225,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 27.8),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You have a problem?!",
                            style: normalOnes,
                          ),
                          Text(
                            "Don't worry!",
                            style: boldOnes,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 33,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 21),
                      child: Container(
                        padding: const EdgeInsets.only(left: 11),
                        height: 65,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                  color: myGrey,
                                  offset: const Offset(0, 10),
                                  blurRadius: 15.0)
                            ]),
                        child: Row(
                          children: [
                            Image.asset(
                              'images/tzFlag.PNG',
                              height: 15.46,
                              width: 23.59,
                            ),
                            const SizedBox(
                              width: 8.4,
                            ),
                            Text(
                              '+255',
                              style: normalOnes,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 25,
                              color: Colors.grey[300],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Text(
                              'Enter you phone number',
                              style: normalOnes,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: RichText(
                          text: TextSpan(
                              style: normalOnes,
                              children: const <TextSpan>[
                                TextSpan(text: "No problem? "),
                                TextSpan(text: "Sign In")
                              ])),
                    ),
                    const SizedBox(
                      height: 48,
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
            ],
          ),
        ),
      ),
    );
  }
}