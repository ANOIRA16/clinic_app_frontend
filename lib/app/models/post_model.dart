

class PostPaginateModel {
  String? currentPage, from, lastPage, perPage, to, total;
  PostModelList? data;
  List<Map<String, dynamic>> source = [];

  PostPaginateModel.fromJson(dynamic json) {
    currentPage = json['current_page'].toString();
    from = json['from'].toString();
    lastPage = json['last_page'].toString();
    perPage = json['per_page'].toString();
    to = json['to'].toString();
    total = json['total'].toString();
    data = json['data'] == null ? null : PostModelList.fromJson(json['data']);
    source = _generateData(
        perPage!, currentPage!, PostModelList.fromJson(json['data']).list);
  }
}

class PostModelList {
  List<PostModel> list = [];
  List<Map> listMap = [];

  PostModelList.fromJson(res) {
    List data = res;

    for (int i = 0; i < data.length; i++) {
      list.add(PostModel.fromJson(data[i]));
      listMap.add(data[i]);
    }
  }
}

class PostModel {
  String? id, createdAt, updatedAt, title, description, status;

  PostModel.fromJson(Map json) {
    id = json['_id'].toString();
    title = json['title'].toString();
    status = json['status'].toString();
    description = json['description'].toString();
    createdAt = json['created_at'].toString();
    // created_at = DateTimeConverter.greToJalali(json['created_at'].toString(),
    //     hasTime: true,showTime: true);
    updatedAt = json['updated_at'].toString();
  }
}

List<Map<String, dynamic>> _generateData(
    String perPage, String currentPage, List<PostModel> source) {
  List<Map<String, dynamic>> temps = [];
  var i = (int.parse(currentPage) - 1) * int.parse(perPage);
  for (PostModel data in source) {
    i++;
    temps.add({
      "id": i,
      "data": data,
      "created_at": data.createdAt.toString(),
      "description": data.description.toString(),
      "status": data.status.toString(),
      "title": data.title.toString(),
      "received": [i]
    });
  }
  return temps;
}
