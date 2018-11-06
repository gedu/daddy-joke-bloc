import 'dart:async';

import 'package:daddy_joke_bloc_reference/base/block_provider.dart';
import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';

class HomeBloc implements BlocBase {

  DaddyJoke daddyJoke;

  StreamController<DaddyJoke> _controller = StreamController();
  StreamSink<DaddyJoke> get _value => _controller.sink;
  Stream<DaddyJoke> get listen => _controller.stream;

  setValue(DaddyJoke daddyJoke) {
    this.daddyJoke = daddyJoke;
    _value.add(this.daddyJoke);
  }

  @override
  void dispose() {
    _controller.close();
  }


}