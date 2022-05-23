import 'package:flutter/material.dart';

import 'package:mtungi_chap_chap/constants.dart';
import 'package:mtungi_chap_chap/widgets/todayGraphWidget.dart';
import 'package:mtungi_chap_chap/widgets/weeklyGraphWidget.dart';


class StatsWidget extends StatelessWidget {
  const StatsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20,),
          width: double.infinity,
          height: 417,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: myGrey,
                  offset: const Offset(0, 10),
                  blurRadius: 15.0)
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child:DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TabBar(
                      indicatorColor: themeColor,
                      unselectedLabelColor: myGrey,
                      labelColor: themeColor,
                      tabs: const [
                        Tab(child:Text("WEEKLY")),
                        Tab(child:Text("TODAY")),],
                    )
                  ],
                ),
              ),
              body: const TabBarView(
                children: [
                  WeeklyGraphWidget(),
                  TodayGraphWidget(),],
              ),
            ),
          ),
        ),
      ],
    );
  }
}