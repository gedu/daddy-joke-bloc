import 'dart:async';

import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';
import 'package:daddy_joke_bloc_reference/network/daddy_joke_data_source.dart';

class HomeRepository {
  DaddyJokeDataSource remoteSource;

  Stream<DaddyJoke> getRandomJoke() {
    return remoteSource
        .getRandomJoke()
        .asStream()
        .map((response) => DaddyJoke.parseResponse(response));
  }
}