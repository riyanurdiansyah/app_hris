import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../utils/app_grafik.dart';

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

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        AspectRatio(
          aspectRatio: size.height > 650 ? 2 : 1.6,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: List.generate(
                5,
                (index) => BarChartGroupData(
                  barsSpace: 6,
                  x: index + 1,
                  barRods: [
                    BarChartRodData(
                      toY: (2 * (index + 1)).toDouble(),
                      gradient: onTimeGradient,
                    ),
                    BarChartRodData(
                      toY: (2 * (index + 2)).toDouble(),
                      gradient: lateGradient,
                    )
                  ],
                  showingTooltipIndicators: [0, 1],
                ),
              ),
              gridData: FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
            ),
          ),
        ),
        const SizedBox(
          height: 12,
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
    );
  }
}
