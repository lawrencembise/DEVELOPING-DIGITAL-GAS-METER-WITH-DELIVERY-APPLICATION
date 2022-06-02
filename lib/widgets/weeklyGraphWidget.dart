// ignore: file_names
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/widgets/barChartBar.dart';
import '../main.dart';


final DateTime now = DateTime.now();
final DateTime nextWeek = DateTime.now().add(const Duration(days: 7));
final DateFormat formatter = DateFormat('E,dd MMM yy');
final DateFormat formatter2 = DateFormat('dd MMM yy');
final String formatted = formatter.format(now);
final String formatted2 = formatter2.format(nextWeek);
final DateFormat dayOfWeek = DateFormat('E');

class WeeklyGraphWidget extends StatefulWidget {
  const WeeklyGraphWidget({Key? key}) : super(key: key);

  @override
  State<WeeklyGraphWidget> createState() => _WeeklyGraphWidgetState();
}

class _WeeklyGraphWidgetState extends State<WeeklyGraphWidget> {
  String weekGroup = "groupValue";
  int height = 0;

  Map weekData ={
    "Mon": 1.2,
    "Tue": 1.0,
    "Wen": 0.0,
    "Thu": 2.0,
    "Fri": 1.1,
    "Sat": 1.2,
    "Sun": 1.6
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 31),
        Text(
          "$formatted - $formatted2",
          style: normalOnes,
        ),
        const SizedBox(
          height: 7,
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
            Text(
              "$height",
              style: boldOnes,
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(top: 22),
          width: 311,
          height: 135,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Mon";
                    height = 40;
                  });
                },
                child: BarChartBar(
                  h: 40,
                  day: "M",
                  dayValue: "Mon",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Tue";
                    height = 60;
                  });
                },
                child: BarChartBar(
                  h: 60,
                  day: "T",
                  dayValue: "Tue",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Wen";
                    height = 90;

                  });
                },
                child: BarChartBar(
                  h: 90,
                  day: "W",
                  dayValue: "Wen",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Thu";
                    height = 40;

                  });
                },
                child: BarChartBar(
                  h: 40,
                  day: "T",
                  dayValue: "Thu",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Fri";
                    height = 60;

                  });
                },
                child: BarChartBar(
                  h: 60,
                  day: "F",
                  dayValue: "Fri",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Sat";
                    height = 30;

                  });
                },
                child: BarChartBar(
                  h: 30,
                  day: "S",
                  dayValue: "Sat",
                  weekGroupValue: weekGroup,
                ),
              ),
              const SizedBox(
                width: 7,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    weekGroup = "Sun";
                    height = 40;

                  });
                },
                child: BarChartBar(
                  h: 40,
                  day: "S",
                  dayValue: "Sun",
                  weekGroupValue: weekGroup,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 19.4,
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
                    "48.30",
                    style: boldOnes,
                  ),
                  Text(
                    "Week Usage",
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

