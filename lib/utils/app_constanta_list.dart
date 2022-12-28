import 'package:app_hris/src/domain/entities/notif_inbox_content_entity.dart';
import 'package:app_hris/src/domain/entities/notif_inbox_entity.dart';
import 'package:app_hris/utils/app_constanta.dart';

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
