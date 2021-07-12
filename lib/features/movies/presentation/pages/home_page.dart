import 'package:filmeira/features/movies/presentation/bloc/movie_popular/movie_popular_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xffEE9F4E),
        toolbarHeight: 0,
      ),
      body: Container(
        color: Color(0xffEE9F4E),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 250),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 300,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(281, 65)),
                        maximumSize:
                            MaterialStateProperty.all<Size>(Size(281, 65)),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Color(0xff181818)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xffFFB060)),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signUp');
                    },
                    child: Text(
                      'Inscreva-se',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w500),
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Color(0xff181818)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
