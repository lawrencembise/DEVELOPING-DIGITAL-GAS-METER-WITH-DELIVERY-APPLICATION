import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DaysLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SfRadialGauge(
          title: GaugeTitle(text: "Days Left", textStyle: normalOnes),
          enableLoadingAnimation: false,
          key: UniqueKey(),
          animationDuration: 2500,
          axes: <RadialAxis>[
            RadialAxis(
              labelOffset: 15,
              axisLineStyle: const AxisLineStyle(
                  thicknessUnit: GaugeSizeUnit.factor, thickness: 0.15),
              radiusFactor: 0.9,
              minimum: 0,
              showTicks: false,
              maximum: 100,
              axisLabelStyle: const GaugeTextStyle(fontSize: 12),
              // Added custom axis renderer that extended from RadialAxisRenderer
              onCreateAxisRenderer: handleCreateAxisRenderer,
              pointers: <GaugePointer>[
                const NeedlePointer(
                  enableAnimation: true,
                  gradient: LinearGradient(colors: <Color>[
                    Color.fromRGBO(203, 126, 223, 0),
                    Color(0xFF4048BF)
                  ], stops: <double>[
                    0.25,
                    0.75
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                  animationType: AnimationType.easeOutBack,
                  value: 20,
                  lengthUnit: GaugeSizeUnit.factor,
                  animationDuration: 1300,
                  needleStartWidth: 1,
                  needleEndWidth: 4,
                  needleLength: 0.8,
                  knobStyle: KnobStyle(
                    knobRadius: 0,
                  ),
                ),
                RangePointer(
                    value: 20,
                    width: 0.15,
                    sizeUnit: GaugeSizeUnit.factor,
                    color: themeColor,
                    animationDuration: 1300,
                    animationType: AnimationType.easeOutBack,
                    gradient: const SweepGradient(
                        colors: <Color>[Color(0xFF4048BF), Color(0xFF58BE3F)],
                        stops: <double>[0.25, 0.75]),
                    enableAnimation: true),
              ],
            )
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
    for (num i = 0; i < 7; i++) {
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
    if (value >= 0 && value <= 5) {
      return (value * 0.167) / 5;
    } else if (value > 5 && value <= 10) {
      return (((value - 5) * 0.167) / (10 - 5)) + (1 * 0.167);
    } else if (value > 10 && value <= 15) {
      return (((value - 10) * 0.167) / (15 - 10)) + (2 * 0.167);
    } else if (value > 15 && value <= 20) {
      return (((value - 15) * 0.167) / (20 - 15)) + (3 * 0.167);
    } else if (value > 20 && value <= 25) {
      return (((value - 20) * 0.167) / (25 - 20)) + (4 * 0.167);
    } else if (value > 25 && value <= 30) {
      return (((value - 25) * 0.167) / (30 - 25)) + (5 * 0.167);
    } else if (value > 30 && value <= 31) {
      return (((value - 30) * 0.167) / (31 - 30)) + (6 * 0.167);
    } else {
      return 1;
    }
  }

  /// To return the label value based on interval
  double _calculateLabelValue(num value) {
    if (value == 0) {
      return 0;
    } else if (value == 1) {
      return 5;
    } else if (value == 2) {
      return 10;
    } else if (value == 3) {
      return 15;
    } else if (value == 4) {
      return 20;
    } else if (value == 5) {
      return 25;
    } else if (value == 6) {
      return 30;
    } else {
      return 31;
    }
  }
}
