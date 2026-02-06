import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'api_response.dart';

class ApiClient {
  static const String baseUrl =
      'https://jsonplaceholder.typicode.com';

  Future<ApiResponse<T>> get<T>(
      String endpoint,
      T Function(dynamic json) parser,
      ) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        return ApiResponse.success(
          parser(json),
          statusCode: response.statusCode,
        );
      } else {
        return ApiResponse.error(
          'Server error',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      debugPrint('API ERROR: $e');
      return ApiResponse.error(e.toString());
    }
  }
}
