


class GPTResponseModel {
  String? id,object,created;
  ChoicesListModel? choices;
  UsageModel? usage;

  GPTResponseModel.fromJson(dynamic json) {

    id = json['id'].toString();
    object = json['object'].toString();
    choices = json['choices'] == null ? null : ChoicesListModel.fromJson(json['choices']);
    usage = json['usage'] == null ? null : UsageModel.fromJson(json['usage']);
    created = json['created'].toString();
  }
}

class UsageModel {
  String? promptTokens,completionTokens,totalTokens;

  UsageModel.fromJson(dynamic json) {

    promptTokens = json['prompt_tokens'].toString();
    completionTokens = json['completion_tokens'].toString();
    totalTokens = json['total_tokens'].toString();
  }
}

class ChoicesListModel {
  List<ChoicesModel> list = [];

  ChoicesListModel.fromJson(res) {
    List data = res;

    for (int i = 0; i < data.length; i++) {
      list.add(ChoicesModel.fromJson(data[i]));
    }

  }
}


class ChoicesModel {
  String? index,finishReason;
  MessageModel? message;

  ChoicesModel.fromJson(dynamic json) {

    message = json['message'] == null ? null : MessageModel.fromJson(json['message']);
    index = json['index'].toString();
    finishReason = json['finish_reason'].toString();
  }
}

class MessageModel {
  String? role,content;

  MessageModel.fromJson(dynamic json) {

    role = json['role'].toString();
    content = json['content'].toString();
  }
}








