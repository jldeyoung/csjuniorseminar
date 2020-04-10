import 'package:flutter/cupertino.dart';

Map<int, Color> _cardinalColorMap = {50: Color.fromRGBO(121, 23, 22, .1),     100: Color.fromRGBO(121, 23, 22, .2),     200: Color.fromRGBO(121, 23, 22, .3),     300: Color.fromRGBO(121, 23, 22, .4),     400: Color.fromRGBO(121, 23, 22, .5),     500: Color.fromRGBO(121, 23, 22, .6),     600: Color.fromRGBO(121, 23, 22, .7),     700: Color.fromRGBO(121, 23, 22, .8),     800: Color.fromRGBO(121, 23, 22, .9),     900: Color.fromRGBO(121, 23, 22, 1.0)};
Map<int, String> _gameNames = {0:"Game0 Title", 1:"Game1 Title", 2:"Game2 Title", 3:"Game3 Title"};
List<int> _games = [0,1,2,3];
int _currentGame = 0;
///List<LeaderboardItem> _leaderboard = [ LeaderboardItem() ]; to be completed

const cardinalRed = Color(0xFF791716); ///Inefficient but not sure which one is needed
Color CardinalRedColor(){
  return cardinalRed; //Color(0xFF791716);
}