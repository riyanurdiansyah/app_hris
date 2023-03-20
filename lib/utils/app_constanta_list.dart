import 'package:app_hris/src/domain/entities/notif_inbox_content_entity.dart';
import 'package:app_hris/src/domain/entities/notif_inbox_entity.dart';
import 'package:app_hris/src/domain/entities/template_entity.dart';
import 'package:app_hris/utils/app_constanta.dart';

import '../src/domain/entities/rekap_attendance_entity.dart';
import '../src/domain/entities/side_navbar_entity.dart';

List<NotifInboxEntity> listInbox = [
  NotifInboxEntity(
    type: "delegation",
    senderName: "Eduardus Nico",
    senderImage: exampleImage,
    receiverId: 0,
    createdAt:
        DateTime.now().subtract(const Duration(hours: 50)).toIso8601String(),
    content: NotifInboxContentDelegatedEntity(
      title: "Eduardus has delegated his/her approval access to you.",
      typeName: "Delegation",
      content: "Handle all request from Product",
      startDate:
          DateTime.now().subtract(const Duration(hours: 48)).toIso8601String(),
      endDate: DateTime.now().toIso8601String(),
    ),
  ),
  NotifInboxEntity(
    type: "attendace",
    senderName: "Eduardus Nico",
    senderImage: exampleImage,
    receiverId: 0,
    createdAt:
        DateTime.now().subtract(const Duration(hours: 24)).toIso8601String(),
    content: NotifInboxContentRequestAttendanceEntity(
      title: "Your request attendance",
      typeName: "request attendance",
      clockIn:
          DateTime.now().subtract(const Duration(hours: 24)).toIso8601String(),
      clockOut: "",
      description: loremIpsum,
    ),
  ),
  NotifInboxEntity(
    type: "attendace",
    senderName: "Eduardus Nico",
    senderImage: exampleImage,
    receiverId: 0,
    createdAt:
        DateTime.now().subtract(const Duration(hours: 24)).toIso8601String(),
    content: NotifInboxContentOvertimeEntity(
      title: "Your request overtime has been approved",
      typeName: "Request Overtime",
      hoursBeforeShift: 0,
      hoursAfterShift: 3,
      minutesBeforeShift: 0,
      minutesAfterShift: 30,
      reason: "Migrasi Prakerja V2",
      compensation: "Paid Overtime",
    ),
  ),
  NotifInboxEntity(
    type: "timeoff",
    senderName: "Eduardus Nico",
    senderImage: exampleImage,
    receiverId: 0,
    createdAt:
        DateTime.now().subtract(const Duration(hours: 24)).toIso8601String(),
    content: NotifInboxContentRequestTimeOffEntity(
      title: "Request time off has been approveed",
      typeName: "Request Time Off",
      reason: "Kurang Enak Badan",
      startDate:
          DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
      endDate: DateTime.now().toIso8601String(),
      file: "",
    ),
  ),
];

List<SideNavbarEntity> listSidebar = [
  SideNavbarEntity(
    title: "Home",
    image: "assets/images/sidebar/home.png",
    route: "home",
    role: 99,
  ),
  SideNavbarEntity(
    title: "Attendance",
    image: "assets/images/sidebar/attendance.png",
    route: "attendance",
    role: 99,
  ),
  SideNavbarEntity(
    title: "Request",
    image: "assets/images/sidebar/request.png",
    route: "request",
    role: 99,
  ),
  SideNavbarEntity(
    title: "Profile",
    image: "assets/images/sidebar/profile.png",
    route: "profile",
    role: 99,
  ),
  SideNavbarEntity(
    title: "Blast",
    image: "assets/images/sidebar/whatsapp.png",
    route: "blast",
    role: 99,
  ),
];

List<TemplateEntity> templateBlast = [
  const TemplateEntity(
    name: "Informasi",
    kode: "informasi",
  ),
  // const TemplateEntity(
  //   name: "Undangan",
  //   kode: "invitation",
  // ),
];

List<String> listBlast = [
  "Single",
  "Multiple",
];

List<String> listProfile = [
  "Personal",
  "Pekerjaan",
  "Payroll",
];

RekapAttendanceEntity listRekap = RekapAttendanceEntity(
  message: "Data has been listed",
  data: [
    UserRekapAttendanceEntity(
      userId: "1",
      userName: "Riyan Nurdiansyah",
      userAbsensi: [
        AbsenRekapAttendanceEntity(
          clockin: DateTime.now().toIso8601String(),
          clockout: "",
          noteClockin: "",
          noteClockout: "",
        ),
        const AbsenRekapAttendanceEntity(
          clockin: "",
          clockout: "",
          noteClockin: "",
          noteClockout: "",
        )
      ],
    ),
    UserRekapAttendanceEntity(
      userId: "2",
      userName: "Sike Avika",
      userAbsensi: [
        AbsenRekapAttendanceEntity(
          clockin:
              DateTime.now().add(const Duration(hours: 4)).toIso8601String(),
          clockout: "",
          noteClockin: "",
          noteClockout: "",
        ),
        const AbsenRekapAttendanceEntity(
          clockin: "",
          clockout: "",
          noteClockin: "",
          noteClockout: "",
        )
      ],
    ),
    const UserRekapAttendanceEntity(
      userId: "3",
      userName: "Riyan Avika",
      userAbsensi: [],
    ),
  ],
);
