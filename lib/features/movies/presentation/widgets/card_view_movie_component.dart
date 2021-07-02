import 'package:flutter/material.dart';

class CardViewMovieComponent extends StatefulWidget {
  final String _pathImage;
  final num _percentage;

  CardViewMovieComponent(
    this._pathImage,
    this._percentage,
  );

  @override
  _CardViewMovieComponentState createState() => _CardViewMovieComponentState();
}

class _CardViewMovieComponentState extends State<CardViewMovieComponent> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25.0, right: 15.0),
              width: 150.0,
              height: 240.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget._pathImage),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(7.0),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              left: 10.0,
              child: Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff081c22),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(left: 9.0),
                    child: Row(
                      children: [
                        Text(
                          (widget._percentage.toDouble() * 10)
                              .toStringAsFixed(0),
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 11.0,
                              color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "%",
                            style:
                                TextStyle(fontSize: 6.0, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 14.0,
              left: 14.0,
              child: Container(
                width: 27.0,
                height: 27.0,
                child: CircularProgressIndicator(
                  value: (widget._percentage.toInt() * 10) / 100,
                  valueColor: (widget._percentage.toInt() * 10) < 70
                      ? AlwaysStoppedAnimation<Color>(Colors.yellowAccent)
                      : AlwaysStoppedAnimation<Color>(Colors.green),
                  strokeWidth: 2.0,
                ),
              ),
            ),
            Positioned(
              bottom: 14.0,
              left: 14.0,
              child: Container(
                width: 27.0,
                height: 27.0,
                child: CircularProgressIndicator(
                  value: (widget._percentage.toInt() * 10) / 100,
                  valueColor: (widget._percentage.toInt() * 10) < 70
                      ? AlwaysStoppedAnimation<Color>(
                          Colors.yellow.withOpacity(0.5),
                        )
                      : AlwaysStoppedAnimation<Color>(
                          Colors.green.withOpacity(0.5),
                        ),
                  strokeWidth: 2.0,
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              child: Container(
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (_isFavorite == true) {
                          _isFavorite = false;
                        } else {
                          _isFavorite = true;
                        }
                      });
                    },
                    icon: _isFavorite
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 17.0,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.white,
                            size: 17.0,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
