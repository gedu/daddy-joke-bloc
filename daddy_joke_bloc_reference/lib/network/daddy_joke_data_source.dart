import 'package:daddy_joke_bloc_reference/network/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';

class DaddyJokeDataSource {
  static const String HOST = "https://icanhazdadjoke.com/";

  Future<ApiResponse<DaddyJokeResponse>> getRandomJoke() async {
    try {
      var response = await http.get(Uri.encodeFull(HOST),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        return SuccessApiResponse(DaddyJokeResponse.fromJson(json.decode(response.body)));
      } else {
        return ErrorApiResponse('Failed to load post');
      }
    } catch (e) {
      return ErrorApiResponse('No internet');
    }
  }
}