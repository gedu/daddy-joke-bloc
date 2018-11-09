import 'dart:async';

import 'package:daddy_joke_bloc_reference/model/Resource.dart';
import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';
import 'package:daddy_joke_bloc_reference/network/api_response.dart';
import 'package:daddy_joke_bloc_reference/network/daddy_joke_data_source.dart';
import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';

class HomeRepository {
  DaddyJokeDataSource remoteSource;

  HomeRepository(this.remoteSource);

  Stream<Resource<DaddyJoke>> getRandomJoke() {
    return remoteSource
        .getRandomJoke()
        .asStream()
        .map(_handleJokeResponse);
  }

  Resource<DaddyJoke> _handleJokeResponse(ApiResponse<DaddyJokeResponse> response) {
    if (response is SuccessApiResponse) {
      return Resource.success(DaddyJoke.parseResponse((response as SuccessApiResponse).data));
    } else {
      return Resource.error((response as ErrorApiResponse).message);
    }
  }
}
