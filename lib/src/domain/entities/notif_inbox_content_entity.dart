class NotifInboxContentDelegatedEntity {
  NotifInboxContentDelegatedEntity({
    required this.title,
    required this.typeName,
    required this.startDate,
    required this.endDate,
    required this.content,
  });

  final String title;
  final String typeName;
  final String startDate;
  final String endDate;
  final String content;
}

class NotifInboxContentOvertimeEntity {
  NotifInboxContentOvertimeEntity({
    required this.title,
    required this.typeName,
    required this.hoursBeforeShift,
    required this.hoursAfterShift,
    required this.minutesBeforeShift,
    required this.minutesAfterShift,
    required this.reason,
    required this.compensation,
  });

  final String title;
  final String typeName;
  final int hoursBeforeShift;
  final int hoursAfterShift;
  final int minutesBeforeShift;
  final int minutesAfterShift;
  final String reason;
  final String compensation;
}

class NotifInboxContentRequestAttendanceEntity {
  NotifInboxContentRequestAttendanceEntity({
    required this.title,
    required this.typeName,
    required this.clockIn,
    required this.clockOut,
    required this.description,
  });

  final String title;
  final String typeName;
  final String clockIn;
  final String clockOut;
  final String description;
}

class NotifInboxContentRequestTimeOffEntity {
  NotifInboxContentRequestTimeOffEntity({
    required this.title,
    required this.typeName,
    required this.reason,
    required this.startDate,
    required this.endDate,
    required this.file,
  });

  final String title;
  final String typeName;
  final String reason;
  final String startDate;
  final String endDate;
  final String file;
}
