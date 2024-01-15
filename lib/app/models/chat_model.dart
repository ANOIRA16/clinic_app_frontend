// import 'converter/date_time_converter.dart';


class ChatModelList {
  List<ChatsModel> list = [];

  ChatModelList.fromJson(res) {
    List data = res;

    for (int i = 0; i < data.length; i++) {
      list.add(ChatsModel.fromJson(data[i]));
    }
  }
}

class ChatsModel {
  String? id, createdAt,createdId, updatedAt, name, message;
  bool? isLoading;
  MessageType? type;

  ChatsModel.fromJson(dynamic json) {
    id = json['_id'].toString();
    type = json['type'].toString() == "send"
        ? MessageType.send
        : MessageType.receive;
    name = json['name'].toString();
    isLoading = json['isLoading'];
    message = json['message'].toString();
    createdId = json['created_id'].toString();
    createdAt = json['created_at'].toString();
    updatedAt = json['updated_at'].toString();
  }
}
enum MessageType { send, receive  }