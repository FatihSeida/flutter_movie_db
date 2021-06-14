part of 'thumbnail_bloc.dart';

abstract class ThumbnailEvent extends Equatable {
  const ThumbnailEvent();

  @override
  List<Object> get props => [];
}

class SelectedItem extends ThumbnailEvent {
  final Movie movie;
  SelectedItem({
    required this.movie,
  });

  @override
  List<Object> get props => [movie];
}
