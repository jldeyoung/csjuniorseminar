import 'package:flutter/material.dart';

//  TODO: Variables to be replaced with Controller
class Controller {
  static var cardinalRedSwatch = MaterialColor(0xFF791716, _cardinalColorMap);
  static var primarySwatch = cardinalRedSwatch;
  static const cardinalRed = Color(0xFF791716);
  static const primaryColor = cardinalRed;
  static const title = 'Assassin';
  static const versionDate = 'April 2020';
  static const versionCode = "1.0";
  static const homePageTitle = 'Assassin';
  static const homeBottomTabTitle = 'Home';
  static const homeBottomTabIcon = Icon(Icons.home);
  static const leaderboardBottomTabTitle = 'Leaderboard';
  static const leaderboardBottomTabIcon = Icon(Icons.format_list_numbered);
  static const feedBottomTabTitle = 'Feed';
  static const feedBottomTabIcon = Icon(Icons.format_align_justify);
  static const settingsBottomTabTitle = 'Settings';
  static const settingsBottomTabIcon = Icon(Icons.settings);
  static var username = "John";

  static Map<int, Color> _cardinalColorMap =
  {
    50: Color.fromRGBO(121, 23, 22, .1),
    100: Color.fromRGBO(121, 23, 22, .2),
    200: Color.fromRGBO(121, 23, 22, .3),
    300: Color.fromRGBO(121, 23, 22, .4),
    400: Color.fromRGBO(121, 23, 22, .5),
    500: Color.fromRGBO(121, 23, 22, .6),
    600: Color.fromRGBO(121, 23, 22, .7),
    700: Color.fromRGBO(121, 23, 22, .8),
    800: Color.fromRGBO(121, 23, 22, .9),
    900: Color.fromRGBO(121, 23, 22, 1.0),
  };

  static Map<int, String> _gameNames = {
    1:"game"
  };

  static List<int> _games = [1, 0];

  static addGame(int gameID, String gameName) {
    _games.insert(_games.length - 1, gameID);
    _gameNames[gameID] = gameName;
  }


  static Map<int, String> getGameNames() {
    return _gameNames;
  }

  static List<int> getGamesIDs() {
    return _games;
  }

  static List<LeaderboardItem> _leaderboard = [
    LeaderboardItem(1, "John Smith", 25),
    LeaderboardItem(2, "Harry Styles", 20),
    LeaderboardItem(3, "Bob Dylan", 15)
  ];

  static List<LeaderboardItem> getLeaderboard() {
    return _leaderboard;
  }

  static int _currentGame = 1;

  static int getCurrentGame() {
    return _currentGame;
  }

  static setCurrentGame(int val) {
    _currentGame = val;
  }

  // TODO: Request new methods:
  static editGameName(int gameID, String gameName) {
    _gameNames[gameID] = gameName;
  }

  static removeGame(int gameID) {
    _games.remove(gameID);
    _gameNames.remove(gameID);
  }

}

class LeaderboardItem {
  var position;
  var name;
  var points;
  LeaderboardItem(this.position, this.name, this.points);
}