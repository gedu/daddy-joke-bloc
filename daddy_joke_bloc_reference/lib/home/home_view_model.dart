import 'dart:async';

import 'package:daddy_joke_bloc_reference/home/home_bloc.dart';
import 'package:daddy_joke_bloc_reference/home/home_repository.dart';
import 'package:daddy_joke_bloc_reference/model/Resource.dart';
import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';

class HomeViewModel {
  HomeBloc homeBloc;
  HomeRepository homeRepository;

  HomeViewModel(this.homeBloc, this.homeRepository);

  Stream<Resource<DaddyJoke>> get listen => homeBloc.listen;

  getRandomJoke() {
    homeBloc.setValue(Resource.loading());
    homeRepository.getRandomJoke().listen(
        (daddyJoke) => homeBloc.setValue(daddyJoke),
        onError: (error) => homeBloc.setValue(Resource.error("Unkown error")));
  }
}
