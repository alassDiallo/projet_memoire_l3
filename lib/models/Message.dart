import '../discussion/PageMessage.dart';

class Mess {
  String message;
  MessageType type;
  String senderid;
  String recipientid;
  String dateenvoi;
  Mess(
      {this.message,
      this.type,
      this.dateenvoi,
      this.recipientid,
      this.senderid});
}
