import 'package:daddy_joke_bloc_reference/network/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

abstract class HttpClientService<T> {

  static const String HOST = "https://icanhazdadjoke.com";
  get headers => {"Accept": "application/json"};

  Future<ApiResponse<T>> get(String path) async {
    try {
      final response = await http.get(Uri.encodeFull("$HOST$path"), headers: headers);
      if (response.statusCode == 200) {
        return SuccessApiResponse(parseToData(json.decode(response.body)));
      } else {
        return ErrorApiResponse('Failed to load post');
      }
    } catch (e) {
      return ErrorApiResponse('No internet');
    }
  }

  T parseToData(dynamic jsonDecoded);
}