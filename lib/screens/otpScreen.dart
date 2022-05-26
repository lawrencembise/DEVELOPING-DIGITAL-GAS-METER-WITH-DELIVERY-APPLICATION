// ignore: file_names
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/settingsScreen.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';
import '../global/userdata.dart';

class OTPScreen extends StatefulWidget {
  late final String phone;
  OTPScreen(this.phone);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  late String _verificationCode;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 45, right: 10, left: 10),
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
                              TextSpan(
                                  text:
                                      "Enter the 4-digit code sent to you at\n " +
                                          "+255" +
                                          widget.phone),
                              TextSpan(
                                  text: "did you enter correct \n number?",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: themeColor)),
                            ])),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 33,
                  ),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (v) async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithCredential(PhoneAuthProvider.credential(
                                verificationId: _verificationCode, smsCode: v))
                            .then((value) async {
                          if (value.user != null) {

                            print("pass to home");
                            userdata?.write("uid", value.user!.uid);
                            userdata?.write("phone", value.user!.phoneNumber);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingsScreen()),
                                (route) => false);
                          }
                        });
                      } catch (e) {
                        Get.snackbar('Error', 'Invalid OTP');
                      }
                    },
                    onChanged: (value) {
                      print(value);
                    },
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
                                  text: "${timer} seconds",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: themeColor)),
                            ])),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                right: 18.5,
                                left: 18.5,
                                top: 19.3,
                                bottom: 19.3),
                            child: Icon(
                              Icons.arrow_forward,
                              size: 15,
                              color: Colors.grey[300],
                            )),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: myGrey,
                                  offset: const Offset(0, 10),
                                  blurRadius: 15.0)
                            ]),
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

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+255" + widget.phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                  (route) => false);
              print("user logged in");
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(color: myGrey, offset: const Offset(0, 10), blurRadius: 15.0)
      ]),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);
