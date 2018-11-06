import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';

class DaddyJokeDataSource {
  static const String HOST = "https://icanhazdadjoke.com/";

  Future<DaddyJokeResponse> getRandomJoke() async {
    var response = await http.get(Uri.encodeFull(HOST),
        headers: {"Accept": "application/json"});

    if (response.statusCode == 200) {
      return DaddyJokeResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}