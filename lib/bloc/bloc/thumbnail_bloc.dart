import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_db/models/models.dart';

part 'thumbnail_event.dart';
part 'thumbnail_state.dart';

class ThumbnailBloc extends Bloc<ThumbnailEvent, ThumbnailMovieState> {
  ThumbnailBloc() : super(ThumbnailMovieInitialState());

  @override
  Stream<ThumbnailMovieState> mapEventToState(
    ThumbnailEvent event,
  ) async* {
    if (event is SelectedItem) {
      yield* _mapSelectedItemToState(state, event.movie);
    }
  }

  Stream<ThumbnailMovieState> _mapSelectedItemToState(
      ThumbnailMovieState state, Movie movie) async* {
    try {
      yield ThumbnailMovieTappedState(movie: movie);
    } catch (e) {}
  }
}
