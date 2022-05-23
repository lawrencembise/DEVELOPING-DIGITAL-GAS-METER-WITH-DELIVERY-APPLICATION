import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/homeScreen.dart';
import 'package:mtungi_chap_chap/screens/signUpScreen.dart';
import 'package:get/get.dart';

import '../global/userdata.dart';
import '../main.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'gas delivery',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 27.8,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            "LOGIN",
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
                          "Welcome!",
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
                            IntlPhoneField(
                              controller: phoneTextEditingController,
                              textInputAction: TextInputAction.next,
                              cursorColor: themeColor,
                              initialCountryCode: "TZ",
                              dropdownIconPosition: IconPosition.trailing,
                              dropdownIcon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: myGrey,
                                size: 25,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: myGrey)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: themeColor)),
                                enabled: false,
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: 22,
                                  right: 7,
                                ),
                                labelText: 'Enter your phone number',
                                hintText: 'Phone number eg. 621826423',
                                labelStyle: normalOnes,
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
                            TextField(
                              textInputAction: TextInputAction.done,
                              onChanged: (pass) {
                                print(pass);
                              },
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
                            Text(
                              'Forget password?',
                              style: normalOnes,
                            ),
                            const SizedBox(height: 31),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            dbRef
                                .reference()
                                .orderByChild("mobile")
                                .equalTo(phoneTextEditingController.text)
                                .get()
                                .then((value) {
                              if (value.value == null) {
                                Get.snackbar("Error", "No user found ${phoneTextEditingController.text}");
                                return;
                              }
                              Map data = value.value;
                              data.forEach((key, value) {
                                if (passwordTextEditingController.text ==
                                        value['password'] &&
                                    ("+255" + phoneTextEditingController.text ==
                                        value['mobile'])) {

                                  userdata?.write("uid",value["uid"]);
                                  userdata?.write("phone",value["mobile"]);

                                  print("User Exist");
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreen()),
                                      (route) => false);
                                } else {
                                  Get.snackbar("Error", "Wrong Credentials");

                                }
                              });
                            });

                            // Navigator.push(context, MaterialPageRoute(builder: (c)=>HomeScreen()));
                          },
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
                                    "Login ",
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
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          left: 41,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: Text(
                            'Or Create Account',
                            style: normalOnes,
                          ),
                        ),
                      )
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
