import 'package:dio/dio.dart';

import 'api_constants.dart';

class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  dynamic get(String path) async {
    try {
      Response response;
      _dio.options.headers['accept'] = [
        'application/json'
      ];
      response = await _dio.get('${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('${response.statusMessage},${response.statusCode}');
      }
    } catch (e) {
      print('${e} this is an outermost error');
      throw Exception('something went wrong');
    }
  }
}
