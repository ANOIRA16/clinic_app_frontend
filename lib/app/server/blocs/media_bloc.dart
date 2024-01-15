
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/media_model.dart';
import '../api_provider.dart';
import '../bloc_check.dart';

class MediaBloc<T> {
  final apiProvider = ApiProvider<T>();

  final PublishSubject<T> _publishSubject = PublishSubject<T>();

  Stream<T> get actions => _publishSubject.stream;

  Future fetchShow({
    required String apiAddress,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await apiProvider.fetchDataGet(apiAddress, (res) {
      if (BlocCheck.hasError(res) == "null") {
        if (directResult != null) directResult(res);

        return MediaPaginateModel.fromJson(json.decode(res));
      } else {
        _publishSubject.addError(BlocCheck.hasError(res));

        return null;
      }
    }, fullResponse);

    if (model != null) {
      _publishSubject.add(model);
    }

    return model;
  }
}

final mediaBlocShow = MediaBloc<MediaPaginateModel>();

