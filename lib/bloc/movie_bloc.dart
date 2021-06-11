import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/clients/clients.dart';
import 'package:flutter_movie_db/models/models.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(this.client) : super(MovieInitialState());

  Client client;

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
     if (event is FetchTrending)  {
      yield* _mapFetchTrendingToState(state);
    } 
    // else if (event is FetchMovies) {
    //   yield* _mapFetchMoviesToState(state);
    // } else if (event is FetchLatestMovies) {
    //   yield* _mapFetchLatestMoviesToState(state);
    // } else if (event is FetchUpcomingMovies) {
    //   yield* _mapFetchUpcomingMoviesToState(state);
    // } 
  }

  Stream<MovieState> _mapFetchTrendingToState(MovieState state) async* {
    try {
      final results = await client.getTrending();
      yield MovieLoadedState(results);
    } catch (e) {
      yield MovieErrorState();
    }
  }

  // Stream<MovieState> _mapFetchMoviesToState(MovieState state) async* {
  //   var results;
  //   yield MovieLoaded(results);
  // }

  // Stream<MovieState> _mapFetchLatestMoviesToState(MovieState state) async* {
  //   var results;
  //   yield MovieLoaded(results);
  // }

  // Stream<MovieState> _mapFetchUpcomingMoviesToState(MovieState state) async* {
  //   var results;
  //   yield MovieLoaded(results);
  // }
}
