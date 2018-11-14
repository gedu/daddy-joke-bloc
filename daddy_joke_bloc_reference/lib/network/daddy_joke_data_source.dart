import 'package:daddy_joke_bloc_reference/network/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';
import 'package:daddy_joke_bloc_reference/network/services/joke_service.dart';

class DaddyJokeDataSource {
  final JokeService jokeService;

  DaddyJokeDataSource(this.jokeService);

  Future<ApiResponse<DaddyJokeResponse>> getRandomJoke() async {
    return jokeService.getRandomJoke();
  }
}