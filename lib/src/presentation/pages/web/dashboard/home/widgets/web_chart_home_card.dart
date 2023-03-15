import 'package:app_hris/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WebChartHomeCard extends StatelessWidget {
  const WebChartHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    List<RekapAttendanceDivision> listData = [
      RekapAttendanceDivision(attendance: 25, divisi: "Academic", ontime: 20),
      RekapAttendanceDivision(attendance: 13, divisi: "Tech", ontime: 13),
      RekapAttendanceDivision(attendance: 10, divisi: "Product", ontime: 9),
      RekapAttendanceDivision(attendance: 12, divisi: "HR", ontime: 6),
      RekapAttendanceDivision(attendance: 17, divisi: "Finance", ontime: 15),
    ];

    return SfCartesianChart(
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
      ),
      series: <ChartSeries>[
        BarSeries<RekapAttendanceDivision, String>(
          dataSource: listData,
          xValueMapper: (data, index) => data.divisi,
          yValueMapper: (data, index) => data.attendance,
          name: "On Time",
          color: colorPrimary,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BarSeries<RekapAttendanceDivision, String>(
          name: "Kehadiran",
          dataSource: listData,
          xValueMapper: (data, index) => data.divisi,
          yValueMapper: (data, index) => data.ontime,
          color: colorPrimaryDark,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: GoogleFonts.poppins(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      primaryXAxis: CategoryAxis(
        labelStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade600,
        ),
      ),
      primaryYAxis: NumericAxis(
        edgeLabelPlacement: EdgeLabelPlacement.shift,
      ),
    );
  }
}

class RekapAttendanceDivision {
  RekapAttendanceDivision({
    required this.divisi,
    required this.attendance,
    required this.ontime,
  });

  final String divisi;
  final int attendance;
  final int ontime;
}
