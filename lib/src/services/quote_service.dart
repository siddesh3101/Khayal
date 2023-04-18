import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class GetQuotesService {
  late final _apiLink;
  late final Dio _dio;
  late final _timeNow;

  GetQuotesService() {
    _apiLink = "https://api.api-ninjas.com/v1/";
    _dio = Dio(
      BaseOptions(
        headers: {
          "Content-Type": "application/json",
          "X-Api-Key": "tcCkJn645FWpnlmcsClliw==MN4hTkrRekjeyXms"
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

  Future<List<dynamic>> getQuotes() async {
    try {
      Response response = await _dio.get(
        '/quotes',
        // data: dataTest,
      );

      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}
