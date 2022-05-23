// ignore: file_names

import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/screens/signInScreen.dart';
import 'package:mtungi_chap_chap/screens/signUpScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'gas delivery',
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        DateTime pre_backpress = DateTime.now();
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= Duration(seconds: 2);
        pre_backpress = DateTime.now();

        if(cantExit){
          final snack = SnackBar(content: Text("Press Back button again to Exit "),duration: Duration(seconds: 2),);

          ScaffoldMessenger.of(context).showSnackBar(snack);
          return false;

        }
        else{
          return false;
        }
      }
      ,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 20, top: 52),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, Nice to meet you!',
                          style: normalOnes,
                        ),
                        Text(
                          'Get a new experience',
                          style: boldOnes,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 515,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 173, bottom: 114),
                      child: LayoutBuilder(
                        builder: (context, constraints) => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: constraints.biggest.height,
                            child: Image.asset(
                              "images/logo.png",
                              fit: BoxFit.contain,
                              height: 225,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 515,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const SignInScreen()));
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Login with Phone",
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
          ),
        ),
      ),
    );
  }
}
