import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

LinearGradient get lateGradient => LinearGradient(
      colors: [
        Colors.blue.shade200,
        Colors.blue,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

LinearGradient get onTimeGradient => LinearGradient(
      colors: [
        Colors.red.shade200,
        Colors.red,
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
Widget allTimeTitles(double value, TitleMeta meta) {
  String text = "";
  final val = value.toInt();
  if (val <= 2) {
    text = "Jan-Feb";
  } else if (val <= 4) {
    text = "Mar-Apr";
  } else if (val <= 6) {
    text = "Mei-Jun";
  } else if (val <= 8) {
    text = "Jul-Agu";
  } else if (val <= 10) {
    text = "Sep-Okt";
  } else {
    text = "Nov-Des";
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 10,
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

BarTouchData get barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.transparent,
        tooltipPadding: EdgeInsets.zero,
        tooltipMargin: 8,
        getTooltipItem: (
          BarChartGroupData group,
          int groupIndex,
          BarChartRodData rod,
          int rodIndex,
        ) {
          return BarTooltipItem(
            rod.toY.round().toString(),
            GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          );
        },
      ),
    );
