import 'package:flutter/material.dart';
import 'package:flutter_movie_db/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingScreen extends StatefulWidget {
  @override
  _TrendingScreenState createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  late MovieBloc bloc;

  @override
  void initState() {
    bloc = context.read<MovieBloc>();
    bloc.add(FetchTrending());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoadedState) {
            return Center(
              child: Container(
                height: 240,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 150,
                        child: Card(
                          child: Column(
                            children: <Widget>[
                              Image.network('https://image.tmdb.org/t/p/w500/${state.items[index].posterPath}', height: 200,),
                              Text(state.items[index].title),
                            ],
                          ),
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
    );
  }
}
