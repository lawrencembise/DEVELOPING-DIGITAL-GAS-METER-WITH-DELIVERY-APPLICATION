import 'package:flutter/material.dart';

//Theme Color
var themeColor = const Color(0xFF58BE3F);
var myGrey  =   Colors.grey[300]!;
 var themeColour = 0xFF58BE3F;


//Text Styles
var normalOnes = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: Color(0xFF797979),
    fontFamily: 'Poppins');

var boldOnes = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    fontFamily: 'Poppins');
var sidebarText = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: 'Poppins');

var draggableBoldOnes = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'Poppins');


var boldGray = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15,
    color: Colors.grey[300],
    fontFamily: 'Poppins');

var buttonTextOnes = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    fontFamily: 'Poppins',
    color: Colors.white);

var greenBar = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Color(0xFF58BE3F),
    fontFamily: 'Poppins');

var tinyOnes = const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 12,
    color: Color(0xFF797979),
    fontFamily: 'Poppins');

var aliens = TextStyle(
   fontWeight: FontWeight.normal,
   fontSize: 12,
   color: themeColor,
   fontFamily: 'Poppins');

var unClicked =  BoxDecoration(border: Border.all(color: themeColor));
var clicked = BoxDecoration(color: themeColor);