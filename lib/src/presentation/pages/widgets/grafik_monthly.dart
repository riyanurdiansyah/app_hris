import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikMonthly extends StatelessWidget {
  const GrafikMonthly({super.key});

  Widget bottomTitles(double value, TitleMeta meta) {
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

  BarChartGroupData generateGroupData(
    int x,
    double onLate,
    double onTime,
  ) {
    return BarChartGroupData(
      x: x,
      groupVertically: false,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(4),
          fromY: 0,
          toY: onLate,
          color: Colors.red,
          width: 20,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(4),
          fromY: 0,
          toY: onTime,
          color: Colors.blue,
          width: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.8,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: bottomTitles,
                      reservedSize: 35,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: [
                  generateGroupData(2, 2, 2),
                  generateGroupData(4, 1, 3),
                  generateGroupData(6, 4, 2),
                  generateGroupData(8, 4, 2),
                  generateGroupData(10, 4, 2),
                  generateGroupData(12, 4, 2),
                ],
                maxY: 6,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Late",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                width: 35,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "On Time",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
