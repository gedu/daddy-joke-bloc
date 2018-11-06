import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';

class DaddyJoke {
  final String id;
  final String joke;

  DaddyJoke(this.id, this.joke);

  DaddyJoke.parseResponse(DaddyJokeResponse response)
      : id = response.id,
        joke = response.joke;
}
