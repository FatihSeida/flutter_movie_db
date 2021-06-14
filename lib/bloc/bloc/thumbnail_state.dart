part of 'thumbnail_bloc.dart';

abstract class ThumbnailMovieState extends Equatable {
  const ThumbnailMovieState();

  @override
  List<Object> get props => [];
}

class ThumbnailMovieInitialState extends ThumbnailMovieState {}

class ThumbnailMovieTappedState extends ThumbnailMovieState {
  final Movie movie;
  ThumbnailMovieTappedState({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];
}
