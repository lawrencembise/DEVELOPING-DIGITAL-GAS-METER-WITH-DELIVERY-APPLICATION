import 'dart:ui';

import 'package:flutter/material.dart ';
import 'package:mtungi_chap_chap/constants.dart';

class ToggleButton extends StatefulWidget {
  String buttonText;
  String groupValue;

  ToggleButton({required this.buttonText, required this.groupValue});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: widget.buttonText == widget.groupValue ? clicked : unClicked,
      height: 42,
      width: 152,
      child: Text(
        widget.buttonText,
        style:
            widget.buttonText == widget.groupValue ? buttonTextOnes : greenBar,
      ),
    );
  }
}
