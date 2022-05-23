import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/fourthScreen.dart';

import 'otpScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final GlobalKey<FormState> _formKey;
  TextEditingController phoneTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                            ),
                          ],
                        ),
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
                              "Hello, nice to meet you!",
                              style: normalOnes,
                            ),
                            Text(
                              "Register!",
                              style: boldOnes,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(left: 5, bottom: 4),
                          width: double.infinity,
                          height: 55,
                          child: IntlPhoneField(
                            controller: phoneTextEditingController,
                            textInputAction: TextInputAction.done,
                            initialCountryCode: "TZ",
                            dropdownIconPosition: IconPosition.trailing,
                            dropdownIcon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: myGrey,
                              size: 25,
                            ),
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.only(
                                top: 22,
                                right: 7,
                              ),
                              hintText: 'Phone number eg. 621826423',
                              hintStyle: normalOnes,
                              enabled: false,
                            ),
                            onChanged: (phone) {
                              // ignore: avoid_print
                              print(phone.completeNumber);
                            },
                            onCountryChanged: (country) {
                              // ignore: avoid_print
                              print('Country changed to: ' + country.name);
                            },
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
                              TextSpan(
                                  text:
                                      "By creating an account you agree to our\n"),
                              TextSpan(
                                  text: "Terms of Service ",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: "and "),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],),),
                      ),
                      const SizedBox(
                        height: 48,
                      ),
                      GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 35, right: 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          // _formKey.currentState?.validate();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) => OTPScreen(phoneTextEditingController.text),
                            ),
                          );
                        },
                      ),
                    ],
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
