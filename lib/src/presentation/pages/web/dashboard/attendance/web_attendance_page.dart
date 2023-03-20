import 'package:app_hris/src/presentation/bloc/attendance/attendance_bloc.dart';
import 'package:app_hris/utils/app_constanta_list.dart';
import 'package:app_hris/utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../utils/app_color.dart';
import '../widgets/web_header.dart';

class WebAttendancePage extends StatefulWidget {
  const WebAttendancePage({super.key});

  @override
  State<WebAttendancePage> createState() => _WebAttendancePageState();
}

class _WebAttendancePageState extends State<WebAttendancePage> {
  final _attendanceBloc = AttendanceBloc();
  var dateSelected = DateTime.now();

  @override
  void initState() {
    _attendanceBloc.add(AttendanceInitializeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AttendanceBloc>(
      create: (context) => _attendanceBloc,
      child: Scaffold(
        backgroundColor: backgroundGrey,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(right: 35),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                const WebHeader(),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(horizontal: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: TableCalendar(
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          calendarStyle: CalendarStyle(
                            weekendTextStyle: GoogleFonts.poppins(
                              color: Colors.red,
                            ),
                            canMarkersOverflow: true,
                            holidayTextStyle: GoogleFonts.poppins(
                              color: Colors.red,
                            ),
                          ),
                          calendarFormat: CalendarFormat.month,
                          currentDay: dateSelected,
                          onDaySelected: ((selectedDay, focusedDay) {
                            dateSelected = selectedDay;
                            setState(() {});
                          }),
                          availableGestures: AvailableGestures.all,
                          focusedDay: dateSelected,
                          firstDay: DateTime(1999),
                          lastDay: DateTime(2050),
                          headerStyle: HeaderStyle(
                            headerPadding: EdgeInsets.zero,
                            titleTextStyle: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            formatButtonDecoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            formatButtonVisible: false,
                            formatButtonTextStyle:
                                GoogleFonts.poppins(color: Colors.white),
                            formatButtonShowsNext: true,
                          ),
                          calendarBuilders: CalendarBuilders(
                            selectedBuilder: (context, date, events) =>
                                Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: colorPrimaryDark,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                date.day.toString(),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                            todayBuilder: (context, date, events) => Container(
                              margin: const EdgeInsets.all(4.0),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: colorPrimaryDark,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                date.day.toString(),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ),
                          ),
                          // cal: _controller,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: AppText.labelW600(
                                      "Nama",
                                      14,
                                      Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Expanded(
                                    child: AppText.labelW600(
                                      "Clock In",
                                      14,
                                      Colors.black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppText.labelW600(
                                      "Clock Out",
                                      14,
                                      Colors.black,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Divider(),
                            Column(
                              children: List.generate(
                                listRekap.data.length,
                                (index) => Container(
                                  height: 45,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Expanded(
                                        child: AppText.labelW500(
                                          listRekap.data[index].userName,
                                          14,
                                          Colors.grey.shade600,
                                        ),
                                      ),
                                      Expanded(
                                        child: AppText.labelW500(
                                          listRekap.data[index].userAbsensi
                                                  .isEmpty
                                              ? "-"
                                              : listRekap
                                                      .data[index].userAbsensi
                                                      .where((e) =>
                                                          e.clockin
                                                              .isNotEmpty &&
                                                          DateTime.parse(
                                                                      e.clockin)
                                                                  .day ==
                                                              dateSelected
                                                                  .day &&
                                                          DateTime.parse(
                                                                      e.clockin)
                                                                  .month ==
                                                              dateSelected
                                                                  .month &&
                                                          DateTime.parse(
                                                                      e.clockin)
                                                                  .year ==
                                                              dateSelected.year)
                                                      .toList()
                                                      .isEmpty
                                                  ? "-"
                                                  : listRekap.data[index]
                                                      .userAbsensi[0].clockin,
                                          14,
                                          Colors.grey.shade600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Expanded(
                                        child: AppText.labelW500(
                                          listRekap.data[index].userAbsensi
                                                  .isEmpty
                                              ? "-"
                                              : listRekap
                                                      .data[index].userAbsensi
                                                      .where((e) =>
                                                          e.clockout
                                                              .isNotEmpty &&
                                                          DateTime.parse(e
                                                                      .clockout)
                                                                  .day ==
                                                              dateSelected
                                                                  .day &&
                                                          DateTime.parse(e
                                                                      .clockout)
                                                                  .month ==
                                                              dateSelected
                                                                  .month &&
                                                          DateTime.parse(e
                                                                      .clockout)
                                                                  .year ==
                                                              dateSelected.year)
                                                      .toList()
                                                      .isEmpty
                                                  ? "-"
                                                  : listRekap.data[index]
                                                      .userAbsensi[0].clockout,
                                          14,
                                          Colors.grey.shade600,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
