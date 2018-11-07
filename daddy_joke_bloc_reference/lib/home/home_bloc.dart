import 'dart:async';

import 'package:daddy_joke_bloc_reference/base/block_provider.dart';
import 'package:daddy_joke_bloc_reference/model/Resource.dart';
import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';

class HomeBloc implements BlocBase {

  Resource<DaddyJoke> daddyJoke;

  StreamController<Resource<DaddyJoke>> _controller = StreamController();
  StreamSink<Resource<DaddyJoke>> get _value => _controller.sink;
  Stream<Resource<DaddyJoke>> get listen => _controller.stream;

  setValue(Resource<DaddyJoke> daddyJoke) {
    this.daddyJoke = daddyJoke;
    _value.add(this.daddyJoke);
  }

  @override
  void dispose() {
    _controller.close();
  }


}