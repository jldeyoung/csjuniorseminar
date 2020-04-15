import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

///These require variables I don't currently have/ Don't know where to put
//var cardinalRedSwatch = MaterialColor(0xFF791716,_cardinalColorMap);
//MaterialColor primarySwatch() => cardinalRedSwatch;
//String userDisplayName() => username; //player method??
//Map<int,String> gameTitles() => _gameNames;//where does this belong
//List<int> gameIDs() => _games;
//List<LeaderboardItem> leaderboardList() => _leaderboard;

int _currentGame;
int getCurrentGameID() => _currentGame;
setCurrentGameID(int a){
  _currentGame = a;
}
