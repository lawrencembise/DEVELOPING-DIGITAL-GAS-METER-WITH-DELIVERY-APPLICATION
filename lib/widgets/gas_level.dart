import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class GasLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(child: Scaffold(
      body: SfRadialGauge(
        title: GaugeTitle(text: "Gas Level",
        textStyle: normalOnes),
        enableLoadingAnimation: false,
        key: UniqueKey() ,
        animationDuration: 2500,
        axes: <RadialAxis>[
          RadialAxis(

              labelOffset: 15,
              axisLineStyle: const AxisLineStyle(
                  thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
              radiusFactor:  0.9,
              minimum: 0,
              showTicks: false,
              maximum: 150,
              axisLabelStyle: const GaugeTextStyle(fontSize: 12),
              // Added custom axis renderer that extended from RadialAxisRenderer
              onCreateAxisRenderer: handleCreateAxisRenderer,
              pointers: <GaugePointer>[
                const NeedlePointer(
                    enableAnimation: true,
                    gradient:  LinearGradient(colors: <Color>[
                      Color.fromRGBO(203, 126, 223, 0),
                      Color(0xFF4048BF)
                    ], stops: <double>[
                      0.25,
                      0.75
                    ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                    animationType: AnimationType.easeOutBack,
                    value: 60,
                    lengthUnit: GaugeSizeUnit.factor,
                    animationDuration: 1300,
                    needleStartWidth:  1,
                    needleEndWidth:  4,
                    needleLength: 0.8,
                    knobStyle:  KnobStyle(
                      knobRadius: 0,
                    )),
                RangePointer(
                    value: 60,
                    width: 0.15,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: themeColor,
                    animationDuration: 1300,
                    animationType: AnimationType.easeOutBack,
                    gradient: const SweepGradient(
                        colors: <Color>[ Color(0xFF4048BF), Color(0xFF58BE3F)],
                        stops: <double>[0.25, 0.75]),
                    enableAnimation: true)
              ])
        ],
      ),
    ),
    );
  }
}
GaugeAxisRenderer handleCreateAxisRenderer() {
  final _CustomAxisRenderer _customAxisRenderer = _CustomAxisRenderer();
  return _customAxisRenderer;
}


class _CustomAxisRenderer extends RadialAxisRenderer {
  _CustomAxisRenderer() : super();

  /// Generated the 9 non-linear interval labels from 0 to 150
  /// instead of actual generated labels.
  @override
  List<CircularAxisLabel> generateVisibleLabels() {
    final List<CircularAxisLabel> _visibleLabels = <CircularAxisLabel>[];
    for (num i = 0; i < 10; i++) {
      final double _value = _calculateLabelValue(i);
      final CircularAxisLabel label = CircularAxisLabel(
          axis.axisLabelStyle, _value.toInt().toString(), i, false);
      label.value = _value;
      _visibleLabels.add(label);
    }

    return _visibleLabels;
  }

  /// Returns the factor(0 to 1) from value to place the labels in an axis.
  @override
  double valueToFactor(double value) {
    if (value >= 0 && value <= 20) {
      return (value * 0.111) / 20;
    } else if (value > 20 && value <= 30) {
      return (((value - 20) * 0.111) / (30 - 20)) + (1 * 0.111);
    } else if (value > 30 && value <= 40) {
      return (((value - 30) * 0.111) / (40 - 30)) + (2 * 0.111);
    } else if (value > 40 && value <= 50) {
      return (((value - 40) * 0.111) / (50 - 40)) + (3 * 0.111);
    } else if (value > 50 && value <= 60) {
      return (((value - 50) * 0.111) / (60 - 50)) + (4 * 0.111);
    } else if (value > 60 && value <= 70) {
      return (((value - 60) * 0.111) / (70 - 60)) + (5 * 0.111);
    } else if (value > 70 && value <= 80) {
      return (((value - 70) * 0.111) / (80 - 70)) + (6 * 0.111);
    } else if (value > 80 && value <= 90) {
      return (((value - 80) * 0.111) / (90 - 80)) + (7 * 0.111);
    } else if (value > 90 && value <= 100) {
      return (((value - 90) * 0.111) / (100 - 90)) + (8 * 0.111);
    } else {
      return 1;
    }
  }

  /// To return the label value based on interval
  double _calculateLabelValue(num value) {
    if (value == 0) {
      return 0;
    } else if (value == 1) {
      return 20;
    } else if (value == 2) {
      return 30;
    } else if (value == 3) {
      return 40;
    } else if (value == 4) {
      return 50;
    } else if (value == 5) {
      return 60;
    } else if (value == 6) {
      return 70;
    } else if (value == 7) {
      return 80;
    } else if (value == 8) {
      return 90;
    } else {
      return 100;
    }
  }
}
