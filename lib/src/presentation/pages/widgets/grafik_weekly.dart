import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GrafikWeekly extends StatelessWidget {
  const GrafikWeekly({super.key});

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff787694),
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = 'Sen';
        break;
      case 2:
        text = 'Sel';
        break;
      case 3:
        text = 'Rab';
        break;
      case 4:
        text = 'Kam';
        break;
      case 5:
        text = 'Jum';
        break;
      case 6:
        text = 'Sab';
        break;
      case 7:
        text = 'Min';
        break;
      default:
        text = '';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text, style: style),
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
            aspectRatio: 2,
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
                      reservedSize: 28,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: FlGridData(show: false),
                barGroups: [
                  generateGroupData(1, 4, 0),
                  generateGroupData(2, 2, 2),
                  generateGroupData(3, 3, 1),
                  generateGroupData(4, 1, 3),
                  generateGroupData(5, 4, 2),
                  // generateGroupData(6, 2.3, 3.2, 3),
                  // generateGroupData(7, 2, 4.8, 2.5),
                ],
                maxY: 5,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
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
          ),
        ],
      ),
    );
  }
}
