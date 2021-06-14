import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/bloc/bloc/thumbnail_bloc.dart';
import 'package:flutter_movie_db/clients/clients.dart';

import 'bloc/movie_bloc.dart';
import 'screens/trending/trending_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MovieBloc(Client())),
        BlocProvider(create: (context) => ThumbnailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TrendingScreen(),
      ),
    );
  }
}
