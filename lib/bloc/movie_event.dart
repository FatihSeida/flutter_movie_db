part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchTrending extends MovieEvent {}

class FetchMovies extends MovieEvent {}

class FetchLatestMovies extends MovieEvent {}

class FetchUpcomingMovies extends MovieEvent {}