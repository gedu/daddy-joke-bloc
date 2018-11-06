class DaddyJokeResponse {
  final String id;
  final String joke;
  final int code;

  DaddyJokeResponse(this.id, this.joke, this.code);

  DaddyJokeResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        joke = json["joke"],
        code = json["code"];
}
