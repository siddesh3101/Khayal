import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class TopListService {
  late final _apiLink;
  late final Dio _dio;
  late final _timeNow;

  TopListService() {
    _apiLink = "https://coep.adityasurve1.repl.co/user/";
    _dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          // "X-Api-Key": "tcCkJn645FWpnlmcsClliw==MN4hTkrRekjeyXms"
        },
        baseUrl: _apiLink,
        followRedirects: false,
        validateStatus: (status) {
          return (status ?? 200) < 500;
        },
      ),
    );
    _timeNow = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  }

  Future<List<dynamic>> getTopList() async {
    try {
      Response response = await _dio.post(
        'search',
        data: jsonEncode({"goal": "Sleep", "subgoal": "Sleeping problems"}),
        // data: dataTest,
      );
      print(response.data);

      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
