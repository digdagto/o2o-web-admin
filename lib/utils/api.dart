
import 'package:dio/dio.dart';

class ApiClient {

  static const String baseUrl = "https://api.ordern.co.kr";
  // static const String baseUrl = "http://localhost:8080";
  static const String loginApi = "/api/app/mng/pos/login";

  static final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      final parsedResponse = _parseResponse(response);
      return parsedResponse;
    } catch (error) {
      throw Exception(error ?? 'Something went wrong');
    }
  }

  static Future<Map<String, dynamic>> post(String endpoint, dynamic body) async {
    try {
      final response = await _dio.post(endpoint, data: body);
      final parsedResponse = _parseResponse(response);
      return parsedResponse;
    } catch (error) {
      throw Exception(error ?? 'Something went wrong');
    }
  }

  static Future<Map<String, dynamic>> getWithHeader(String endpoint, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(
          // contentType: Headers.formUrlEncodedContentType,
          headers: headers,
        ),
      );
      final parsedResponse = _parseResponse(response);
      return parsedResponse;
    } catch (error) {
      throw Exception(error ?? 'Something went wrong');
    }
  }

  static Future<Map<String, dynamic>> postWithHeader(String endpoint, dynamic body, {Map<String, dynamic>? headers}) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: body,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: headers,
        ),
      );
      final parsedResponse = _parseResponse(response);
      return parsedResponse;
    } catch (error) {
      throw Exception(error ?? 'Something went wrong');
    }
  }



  static Map<String, dynamic> _parseResponse(Response response) {
    final parsedResponse = response.data;
    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return parsedResponse;
    } else {
      throw Exception(parsedResponse['error']);
    }
  }
}