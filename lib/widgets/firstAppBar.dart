import 'package:flutter/material.dart';
import 'package:mtungi_chap_chap/constants.dart';

var greenTextTopBar = Container(
  padding: const EdgeInsets.only(top: 45, left: 27.8),
  child: Row(children: [
    Icon(Icons.arrow_back, color: themeColor,),
    const SizedBox(
      width: 20,
    ),
    Text("BACK", style: greenBar,)
  ],),
);