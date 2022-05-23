import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mtungi_chap_chap/constants.dart';

final DateTime now = DateTime.now();
final DateFormat formatter = DateFormat('E,dd MMM yy');
final String formatted = formatter.format(now);

class TodayGraphWidget extends StatelessWidget {
  const TodayGraphWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(   height: 30,
        ),
        Text(
          formatted,
          style: normalOnes,
        ),
        const SizedBox(
          height: 37,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 33,
                alignment: Alignment.topRight,
                child: Text(
                  "Kgs",
                  style: aliens,
                )),
            const Text(
              "10.56",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                  fontFamily: 'Poppins'),
            ),
          ],
        ),
        const SizedBox(
          height: 129,
        ),


        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                width: 96,
                height: 70,
                child: VerticalDivider(
                  thickness: 2,
                  color: myGrey,
                ),
              ),
              Column(
                children: [
                  Text(
                    "8.30",
                    style: boldOnes,
                  ),
                  Text(
                    "Today Usage",
                    style: normalOnes,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                width: 96,
                height: 70,
                child: VerticalDivider(
                  thickness: 2,
                  color: myGrey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
