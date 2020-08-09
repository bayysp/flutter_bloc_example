import 'dart:ui';

import 'package:flutter/material.dart';

class Constant {

  static final List<String> tags = [
    "Populars",
    "Top Rated",
    "Now Playing",
    "Latest",
    "Upcoming"
  ];

  static final List<String> apiParams = [
    "popular",
    "top_rated",
    "now_playing",
    "latest",
    "upcoming"
  ];

  static final appBarTitleStyle = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w800
  );

  static final subtitleMenu = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.w400
  );

  static final cardBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(11),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 4.0,
          spreadRadius: 2.0)
    ],
  );
}
