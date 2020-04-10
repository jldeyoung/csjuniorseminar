import 'package:csjuniorseminar/player.dart';

class LeaderboardItem{
  int position;
  String name;
  int points;
  Player localPlayer;

  LeaderboardItem(){
    //localPlayer = [local Player object];
    //position = ???;
    name = localPlayer.getPlayerName();
    points = localPlayer.getPlayerScore();
  }
}