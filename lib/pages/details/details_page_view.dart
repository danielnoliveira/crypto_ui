import 'dart:math';

import 'package:crypto_ui/core/enums/e_range_time.dart';
import 'package:crypto_ui/pages/details/details_page_view_model.dart';
import 'package:crypto_ui/pages/details/widgets/details_app_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsPageView extends DetailsPageViewModel {
  @override
  Widget build(BuildContext context) {
    Size md = MediaQuery.of(context).size;
    var statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: DetailsAppBar(
          defaultSize: Size(md.width, 120),
          coinName: widget.cryptocoinShortName),
      backgroundColor: Colors.transparent,
      body: Container(
        width: md.width,
        height: md.height,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            SizedBox(width: md.width, height: 120 + statusBarHeight),
            Spacer(),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.symmetric(horizontal: md.width * 0.064),
              width: md.width * (1 - (2 * 0.064)),
              height: md.height * 0.49,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                        showOnTopOfTheChartBoxArea: false,
                        maxContentWidth: 100,
                        tooltipRoundedRadius: 8,
                        tooltipBgColor: Color(0x99CC3CFF),
                        getTooltipItems: (touchedSpots) {
                          return touchedSpots.map((LineBarSpot touchedSpot) {
                            final textStyle = GoogleFonts.manrope(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              height: 16 / 12,
                            );
                            return LineTooltipItem('44.926,12 \$', textStyle);
                          }).toList();
                        }),
                    handleBuiltInTouches: true,
                    getTouchLineStart: (data, index) => 0,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      color: Color(0xff81F3A1),
                      spots: spots,
                      isCurved: true,
                      isStrokeCapRound: true,
                      barWidth: 3,
                      belowBarData: BarAreaData(
                        show: false,
                      ),
                      dotData: FlDotData(show: false),
                    ),
                  ],
                  minY: -1.5,
                  maxY: 1.5,
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        reservedSize: 56,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                        reservedSize: 36,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawHorizontalLine: true,
                    drawVerticalLine: false,
                    horizontalInterval: 0.4,
                    verticalInterval: 5,
                    checkToShowHorizontalLine: (value) {
                      return true;
                    },
                    checkToShowVerticalLine: (value) {
                      return value.toInt() == 0;
                    },
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                          color: Colors.white.withOpacity(0.15),
                          strokeWidth: 1,
                          dashArray: [10]);
                    },
                  ),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...eRangeTime.values.map(
                    (e) {
                      TextStyle textStyle = GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        height: 16 / 12,
                        color:
                            Colors.white.withOpacity(e == rangeTime ? 1 : 0.6),
                      );
                      return Padding(
                        padding: EdgeInsets.only(
                            right: e != eRangeTime.OneYear ? 8 : 0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              spots = List.generate(e.getNumberOfSpots(),
                                      (i) => (i - 50) / 10)
                                  .map((x) => FlSpot(x, sin(x)))
                                  .toList();
                              rangeTime = e;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: e == rangeTime
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Text(
                              e.getLabel(),
                              style: textStyle,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: md.width * 0.064),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 16,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff8a54fd), Color(0xffa854fd)],
                          ),
                        ),
                        child: Text(
                          'BUY NOW',
                          style: GoogleFonts.manrope(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            height: 24 / 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
