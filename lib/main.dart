import 'package:filmeira/features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:filmeira/features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:filmeira/features/movies/presentation/pages/movie_list.dart';
import 'package:filmeira/features/movies/presentation/pages/sign_in.dart';
import 'package:filmeira/features/movies/presentation/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'features/movies/presentation/pages/home_page.dart';
import 'injection_container.dart';

Future main() async {
  await init();
  runApp(Movies());
}

class Movies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de Filmes',
      theme: ThemeData(
        fontFamily: 'Futura',
      ),
      routes: <String, WidgetBuilder>{
        '/signIn': (BuildContext context) => SignInPage(),
        '/signUp': (BuildContext context) => SignUpPage(),
        '/listMovie': (BuildContext context) => ListMoviesPage(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<MoviePopularBloc>(),
          ),
          BlocProvider(
            create: (context) => sl<MovieNowPlayingBloc>(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
