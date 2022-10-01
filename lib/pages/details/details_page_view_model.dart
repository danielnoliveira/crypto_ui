import 'dart:math';

import 'package:crypto_ui/core/enums/e_range_time.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'details_page.dart';

abstract class DetailsPageViewModel extends State<DetailsPage> {
  eRangeTime rangeTime = eRangeTime.OneDay;
  var spots = List.generate(101, (i) => (i - 50) / 10)
      .map((x) => FlSpot(x, sin(x)))
      .toList();
}
