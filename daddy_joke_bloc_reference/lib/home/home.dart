import 'package:daddy_joke_bloc_reference/base/block_provider.dart';
import 'package:daddy_joke_bloc_reference/home/home_bloc.dart';
import 'package:daddy_joke_bloc_reference/home/home_repository.dart';
import 'package:daddy_joke_bloc_reference/home/home_view_model.dart';
import 'package:daddy_joke_bloc_reference/model/Resource.dart';
import 'package:daddy_joke_bloc_reference/model/daddy_joke.dart';
import 'package:daddy_joke_bloc_reference/network/daddy_joke_data_source.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    final homeViewModel =
        HomeViewModel(homeBloc, HomeRepository(DaddyJokeDataSource()));
    return Scaffold(
      appBar: AppBar(
        title: Text("Joke"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              _jokeCard(homeViewModel),
              nextJokeButton(homeViewModel)
            ],
          ),
        ),
      ),
    );
  }

  Expanded _jokeCard(HomeViewModel homeViewModel) {
    return Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  constraints: BoxConstraints.expand(),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: StreamBuilder(
                          stream: homeViewModel.listen,
                          initialData: Resource<DaddyJoke>.idle(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Resource<DaddyJoke>> snapshot) {
                            return handleState(snapshot.data);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
  }

  Widget handleState(Resource<DaddyJoke> resource) {
    if (resource.status == Status.LOADING) {
      return CircularProgressIndicator();
    } else {
      return Text(
        resource.hasData
            ? resource.data.joke
            : "Hello world!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24.0,
          fontStyle: FontStyle.italic,
        ),
      );
    }
  }

  Padding nextJokeButton(HomeViewModel homeViewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: FloatingActionButton.extended(
          onPressed: () {
            homeViewModel.getRandomJoke();
          },
          icon: Icon(Icons.refresh),
          label: Text("NEXT JOKE"),
        ),
      ),
    );
  }
}
