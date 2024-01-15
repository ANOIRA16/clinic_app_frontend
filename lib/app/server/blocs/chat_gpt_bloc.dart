import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/chat_gpt_model.dart';
import '../api_provider.dart';
import '../bloc_check.dart';

class ChatGPTBloc<T> {
  final apiProvider = ApiProvider<T>();

  final PublishSubject<T> _publishSubject = PublishSubject<T>();

  Stream<T> get actions => _publishSubject.stream;

  Future fetchShow({
    required String apiAddress,
    required String apiKey,
    required Map<String, dynamic> body,
    Function(String)? directResult,
    Function(Response)? fullResponse,
  }) async {
    var model = await apiProvider.fetchDataPOST(apiAddress, body, (res) {
      if (BlocCheck.hasError(res) == "null") {
        if (directResult != null) directResult(res);

        return GPTResponseModel.fromJson(json.decode(res));
      } else {
        _publishSubject.addError(BlocCheck.hasError(res));
        return null;
      }
    }, fullResponse,
        bearer: 'Bearer $apiKey',
        needAuth: true,

        /// If you want to use an apiUrl or baseUrlAuth  instead of the default baseUrl defined in Strings.apiUrl or Strings.baseUrlAuth
        /// you can set baseUrl and baseUrlAuth in your bloc.
        baseUrl: "https://api.openai.com/v1/");

    if (model != null) {
      _publishSubject.add(model);
    }

    return model;
  }
}

final chatGPTBlocShow = ChatGPTBloc<GPTResponseModel>();
