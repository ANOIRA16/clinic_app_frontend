


class MediaPaginateModel {
  String? currentPage, from, lastPage, perPage, to, total;
  MediaDataModelList? data;

  MediaPaginateModel.fromJson(dynamic json) {
    currentPage = json['current_page'].toString();
    from = json['from'].toString();
    lastPage = json['last_page'].toString();
    perPage = json['per_page'].toString();
    to = json['to'].toString();
    total = json['total'].toString();
    data = json['data'] == null ? null : MediaDataModelList.fromJson(json['data']);

  }
}

class MediaDataModelList {
  List<MediaModel> list = [];

  MediaDataModelList.fromJson(res) {
    List data = res;

    for (int i = 0; i < data.length; i++) {
      list.add(MediaModel.fromJson(data[i]));
    }

  }
}



class MediaModel {
  String? id,title,url/*, created_at, updated_at,  type*/;

  MediaModel.fromJson(dynamic json) {

    id = json['_id'].toString();
    url = json['url'].toString();
    // type = json['type'].toString();
    title = json['title'].toString();
    // created_at = DateTimeConverter.greToJalali(json['created_at'].toString(),hasTime: true,showTime: true);
    // updated_at = json['updated_at'].toString();
  }
}








