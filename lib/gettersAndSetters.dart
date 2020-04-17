import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:csjuniorseminar/LeaderboardItem.dart';


Map<int, Color> _cardinalColorMap = {50: Color.fromRGBO(121, 23, 22, .1),     100: Color.fromRGBO(121, 23, 22, .2),     200: Color.fromRGBO(121, 23, 22, .3),     300: Color.fromRGBO(121, 23, 22, .4),     400: Color.fromRGBO(121, 23, 22, .5),     500: Color.fromRGBO(121, 23, 22, .6),     600: Color.fromRGBO(121, 23, 22, .7),     700: Color.fromRGBO(121, 23, 22, .8),     800: Color.fromRGBO(121, 23, 22, .9),     900: Color.fromRGBO(121, 23, 22, 1.0)};
Map<int, String> _gameNames = {0:"Game0 Title", 1:"Game1 Title", 2:"Game2 Title", 3:"Game3 Title"};
List<int> _games = [0,1,2,3];
int _currentGame = 0;
List<LeaderboardItem> _leaderboard = [LeaderboardItem()];
///List<LeaderboardItem> leaderboardList() => _leaderboard;

const cardinalRed = Color(0xFF791716);
Color primaryColor() => cardinalRed;

String applicationTitle() => "Assassin";
String versionCode() => "1.0";
String versionDate() => "April 2020";
String homepageApplicationTitle() => applicationTitle();
String homeBottomTabTitle() => "Home";
String leaderboardBottomBoardTitle() => "Leaderboard";
String feedBottomTabTitle() => "Feed";
Icon homeBottomTabIcon() => Icon(Icons.home);
Icon leaderboardBottomTabIcon() => Icon(Icons.format_list_numbered);
Icon feedBottomIcon() => Icon(Icons.format_align_justify);


var cardinalRedSwatch = MaterialColor(0xFF791716,_cardinalColorMap);
MaterialColor primarySwatch() => cardinalRedSwatch;
//String userDisplayName() => username; //player method??
Map<int,String> gameTitles() => _gameNames;//where does this belong
List<int> gameIDs() => _games;
int getCurrentGameID() => _currentGame;

///Setters
setCurrentGameID(int a){
  _currentGame = a;
}
addGame(){
  _games.add(_games.length);
  _gameNames[_gameNames.length] = "Game" + "$_gameNames.length" + " Title";
}
