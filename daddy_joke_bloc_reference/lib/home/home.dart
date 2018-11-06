import 'package:daddy_joke_bloc_reference/base/block_provider.dart';
import 'package:daddy_joke_bloc_reference/home/home_bloc.dart';
import 'package:daddy_joke_bloc_reference/home/home_repository.dart';
import 'package:daddy_joke_bloc_reference/home/home_view_model.dart';
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
              Expanded(
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
                            initialData: null,
                            builder: (BuildContext context,
                                AsyncSnapshot<DaddyJoke> snapshot) {
                              return Text(
                                snapshot.hasData
                                    ? snapshot.data.joke
                                    : "Hello world!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontStyle: FontStyle.italic,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      homeViewModel.getRandomJoke();
                    },
                    icon: Icon(Icons.refresh),
                    label: Text("Next Joke"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
