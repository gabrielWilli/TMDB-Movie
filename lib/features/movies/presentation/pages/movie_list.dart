import 'package:filmeira/features/movies/presentation/bloc/movie_now_playing/movie_now_playing_bloc.dart';
import 'package:filmeira/features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:filmeira/features/movies/presentation/widgets/card_view_movie_component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMoviesPage extends StatefulWidget {
  @override
  _ListaFilmesState createState() => _ListaFilmesState();
}

class _ListaFilmesState extends State<ListMoviesPage> {

  @override
  Widget build(BuildContext context) {
    final blocMoviePopular = BlocProvider.of<MoviePopularBloc>(context);
    final blocMovieNowPlaying = BlocProvider.of<MovieNowPlayingBloc>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 10,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color: Colors.black,
            ),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            label: 'Favoritos',
            icon: Icon(
              Icons.favorite_outlined,
              color: Colors.red,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            label: 'Usuário',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/fire.png',
                        width: 25.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Mais',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Populares',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            BlocProvider(
              create: (context) => blocMoviePopular,
              child: BlocBuilder<MoviePopularBloc, MoviePopularState>(
                bloc: blocMoviePopular..add(FetchMoviePopularEvent()),
                builder: (context, state) {
                  if (state is MoviePopularLoadedState)
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 265,
                      child: ListView.builder(
                        itemCount: state.movieEntity.length,
                        itemBuilder: (context, index) {
                          return CardViewMovieComponent(
                            state.movieEntity[index].urlImage.toString(),
                            state.movieEntity[index].vote!,
                          );
                        },
                        padding: EdgeInsets.only(left: 20.0),
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  if (state is MoviePopularErrorState)
                    return Center(
                      child: Text(state.message),
                    );

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 135, top: 105.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                    left: 20.0,
                    bottom: 20.0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/ticket.png',
                        width: 25.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'Nos',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Cinemas',
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            BlocProvider(
              create: (context) => blocMovieNowPlaying,
              child: BlocBuilder<MovieNowPlayingBloc, MovieNowPlayingState>(
                bloc: blocMovieNowPlaying..add(FetchMovieNowPlayEvent()),
                builder: (context, state) {
                  if (state is MovieNowPlayingLoadedState)
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 280,
                      child: ListView.builder(
                        itemCount: state.movieEntity.length,
                        itemBuilder: (context, index) {
                          return CardViewMovieComponent(
                            state.movieEntity[index].urlImage.toString(),
                            state.movieEntity[index].vote!,
                          );
                        },
                        padding: EdgeInsets.only(left: 20.0),
                        scrollDirection: Axis.horizontal,
                      ),
                    );
                  if (state is MovieNowPlayingErrorState)
                    return Center(
                      child: Text(state.message),
                    );
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 135, top: 105.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrangeAccent),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
