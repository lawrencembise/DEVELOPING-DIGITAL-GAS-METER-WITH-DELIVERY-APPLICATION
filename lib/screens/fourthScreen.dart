import 'package:flutter/material.dart';

import 'package:mtungi_chap_chap/constants.dart';

class OtpScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 45, right: 20),
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 149,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 27.8),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone Verification",
                          style: normalOnes,
                        ),
                        Text(
                          "Enter your OTP code",
                          style: boldOnes,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                          text: TextSpan(
                            style: normalOnes,
                            children: <TextSpan>[
                              const TextSpan(
                                  text:
                                      "Enter the 4-digit code sent to you at\n+255 6 2182 6423. "),
                              TextSpan(
                                  text: "did you enter correct \n number?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: themeColor)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 66,
                          height: 53,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 32, left: 32, top: 16, bottom: 14),
                            child: Text(
                              "1",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                  fontSize: 18),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 53,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 32, left: 32, top: 16, bottom: 14),
                            child: Text(
                              "4",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                  fontSize: 18),
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
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 53,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 32, left: 32, top: 16, bottom: 14),
                            child: Text(
                              "6",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                  fontSize: 18),
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
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 66,
                          height: 53,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 32, left: 32, top: 16, bottom: 14),
                            child: Text(
                              ".",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[300],
                                  fontSize: 18),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 46,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        child: RichText(
                          text: TextSpan(
                            style: normalOnes,
                            children: <TextSpan>[
                              const TextSpan(text: "Resend Code in "),
                              TextSpan(
                                  text: "10 seconds",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: themeColor)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 18.5, left: 18.5, top: 19.3, bottom: 19.3),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 15,
                            color: Colors.grey[300],
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: myGrey,
                                offset: const Offset(0, 10),
                                blurRadius: 15.0)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
