import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';

class ConfirmLocationScreen extends StatefulWidget {
  @override
  _ConfirmLocationScreenState createState() => _ConfirmLocationScreenState();
}

class _ConfirmLocationScreenState extends State<ConfirmLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.green,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.4,
            maxChildSize: 0.8,
            builder: (context, controler) => Container(
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 53,
                    ),
                    Text(
                      "Where are you?",
                      style: boldOnes,
                    ),
                    const SizedBox(
                      height: 15.4,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "Set your location so we can deliver the gas at the right spot and find",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Color(0xFF797979),
                                  fontFamily: 'Poppins')),
                          TextSpan(
                              text: "the nearest gas supplier",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12,
                                  color: Color(0xFF797979),
                                  fontFamily: 'Poppins')),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.6,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "SET AUTOMATICALLY",
                        style: buttonTextOnes,
                      ),
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: themeColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const SizedBox(
                      height: 15.6,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "SET LATER",
                        style: greenBar,
                      ),
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: themeColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
