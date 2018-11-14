import 'package:daddy_joke_bloc_reference/network/api_response.dart';
import 'package:daddy_joke_bloc_reference/network/base/http_client_service.dart';
import 'package:daddy_joke_bloc_reference/network/daddy_joke_response.dart';

class JokeService extends HttpClientService<DaddyJokeResponse> {

  @override
  DaddyJokeResponse parseToData(jsonDecoded) => DaddyJokeResponse.fromJson(jsonDecoded);

  Future<ApiResponse<DaddyJokeResponse>> getRandomJoke() => get("/");
}