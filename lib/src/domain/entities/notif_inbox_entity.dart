class NotifInboxEntity {
  NotifInboxEntity({
    required this.type,
    required this.senderName,
    required this.senderImage,
    required this.receiverId,
    required this.createdAt,
    required this.content,
  });

  final String type;
  final String senderName;
  final String senderImage;
  final int receiverId;
  final String createdAt;
  final Object content;
}
