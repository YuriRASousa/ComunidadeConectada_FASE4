class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final String? resourceId;
  final bool isFromMe;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.resourceId,
    this.isFromMe = true,
  });
}
