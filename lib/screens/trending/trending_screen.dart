import 'package:flutter/material.dart';
import 'package:flutter_movie_db/bloc/bloc/thumbnail_bloc.dart';
import 'package:flutter_movie_db/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late MovieBloc bloc;
  late ThumbnailBloc thumbnailBloc;
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    bloc = context.read<MovieBloc>();
    thumbnailBloc = context.read<ThumbnailBloc>();
    bloc.add(FetchTrending());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
          decoration: InputDecoration(
            fillColor: Colors.grey[200],
            filled: true,
            border: InputBorder.none,
            hintText: 'Search Users',
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                // context.read<SearchCubit>().clearSearch();
                _textController.clear();
              },
            ),
          ),
          textInputAction: TextInputAction.search,
          textAlignVertical: TextAlignVertical.center,
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              // context.read<SearchCubit>().searchUsers(value.trim());
            }
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            BlocBuilder<ThumbnailBloc, ThumbnailMovieState>(
              builder: (context, state) {
                if (state is ThumbnailMovieInitialState) {
                  return Container();
                } else if (state is ThumbnailMovieTappedState) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width * 1,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500/${state.movie.posterPath}',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Align(
                        alignment: Alignment(1, 1),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.9),
                                    Colors.black,
                                  ],
                                  stops: [
                                    0.0,
                                    1.0
                                  ])),
                        ),
                      )
                    ],
                  );
                } else {
                  return Text('error');
                }
              },
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieLoadedState) {
                  return Align(
                    alignment: Alignment(1, 0.9),
                    child: Container(
                        height: 240,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(5),
                              width: 150,
                              child: InkWell(
                                onTap: () {
                                  final items = state.items[index];
                                  thumbnailBloc.add(SelectedItem(movie: items));
                                },
                                child: Container(),
                                // Image.network(
                                //   'https://image.tmdb.org/t/p/w500/${state.items[index].posterPath}',
                                //   height: 200,
                                // ),
                              ),
                            );
                          },
                          itemCount: state.items.length,
                        )),
                  );
                } else if (state is MovieLoadingState) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return Container(
                    child: Center(
                      child: Text('Error'),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
