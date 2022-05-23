import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/widgets/weeklyGraphWidget.dart';

class BarChartBar extends StatelessWidget {
   double h;
   String day;
   String dayValue;
   String weekGroupValue;

   BarChartBar({required this.h,required this.day,required this.dayValue,required this.weekGroupValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // GestureDetector(
          //   onTap: () {
          //     print("mon1");
          //     showPopover(
          //       context: context,
          //       transitionDuration: const Duration(milliseconds: 50),
          //       bodyBuilder: (context) => const PopoverText(),
          //       direction: PopoverDirection.bottom,
          //       width: 85,
          //       height: 50,
          //       arrowHeight: 9,
          //       arrowWidth: 20,
          //       radius: 28,
          //     );
          //   },
          //   child:
            Container(
              width: 33,
              height: h,
              decoration: BoxDecoration(
                  color:  dayValue == weekGroupValue ? themeColor :  myGrey,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
            ),
          // ),
          Text(
            day,
            style: normalOnes,
          )
        ],
      ),
    );
  }
}

class PopoverText extends StatelessWidget {
  const PopoverText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Kgs 1.3",
        style: greenBar,
      ),
    );
  }
}
