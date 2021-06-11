part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();
  
  @override
  List<Object> get props => [];
}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final List<Movie> items;

  MovieLoadedState(this.items);
}

class MovieErrorState extends MovieState {}
