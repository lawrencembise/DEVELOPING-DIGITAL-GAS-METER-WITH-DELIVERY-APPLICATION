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
                      height: 201,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 27.8),
                      width: double.infinity,
                      child: Text(
                        "It's very easy!",
                        style: boldOnes,
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 27.8),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New Password',
                            style: tinyOnes,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            '*********',
                            style: tinyOnes,
                          ),
                          const SizedBox(height: 9),

                          // ignore: unnecessary_const
                          const Divider(height: 1,color: const Color(0xFF58BE3F),thickness: 3,endIndent: 20,),

                          const SizedBox(height: 39),
                          Text(
                            'Confirm Password',
                            style: tinyOnes,
                          ),
                          const SizedBox(height: 15),

                          const Divider(height: 1,color: Colors.grey,endIndent: 20,),
                          const SizedBox(height: 77),



                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 35, right: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Complete ",
                                style: buttonTextOnes,
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 33,
                              )
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: const Color(0xFF58BE3F),
                            borderRadius: BorderRadius.circular(8)),
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