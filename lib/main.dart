import 'package:filmeira/features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:filmeira/features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'features/movies/presentation/pages/movie_list.dart';

Future main() async {
  // await dotenv.load(fileName: '.env');
  runApp(Movies());
}

class Movies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Filmes',
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoviePopularBloc(),
          ),
          BlocProvider(
            create: (context) => MovieNowPlayingBloc(),
          ),
        ],
        child: ListMovies(),
      ),
    );
  }
}
