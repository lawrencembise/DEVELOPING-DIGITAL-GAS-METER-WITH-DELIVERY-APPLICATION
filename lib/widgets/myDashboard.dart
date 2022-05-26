import 'package:flutter/material.dart';

import '../constants.dart';
import 'CircleProgress.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({
    Key? key,
    required this.isLoading,
    required this.tempAnimation,
    required this.humidityAnimation,
  }) : super(key: key);

  final bool isLoading;
  final Animation<double> tempAnimation;
  final Animation<double> humidityAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: isLoading
            ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: CustomPaint(
                foregroundPainter:
                CircleProgress(tempAnimation.value, true),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Gas level',style: aliens,),
                        Text(
                          '${tempAnimation.value.toInt()}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '%',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomPaint(
                foregroundPainter:
                CircleProgress(humidityAnimation.value, false),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Gas leakage',style: aliens,),
                        Text(
                          '${humidityAnimation.value.toInt()}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ppm',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: CustomPaint(
                foregroundPainter:
                CircleProgress(humidityAnimation.value, false),
                child: Container(
                  width: 200,
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Days left',style: aliens,),
                        Text(
                          '${humidityAnimation.value.toInt()}',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'days',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )
            : Text(
          'Loading...',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ));
  }
}
