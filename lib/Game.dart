//import 'package:flutter/material.dart';
import 'package:csjuniorseminar/LeaderboardItem.dart';
import 'package:csjuniorseminar/player.dart';

class Game {
  int gameID;
  int adminID;
  List<LeaderboardItem> leaderboard;
  bool gameOver;

  Game(int gID, int aID){
    gameID = gID;
    adminID = aID;
  }

  void setTargets() {
    //get list of players from remote database

    //assign links between user -> target (check for cycles and repeats)

    //set localPlayer.targetID to appropriate value
  }

  void getUsers() {
    //access remote database

    //update local database/list
  }

  //when adding a Player to a game: if(gameOver){return;}
  void startGame() {
    gameOver = false;// update database to show game in progress
    setTargets();
    //get local player info from database
    Player localPlayer = new Player(/*localplayerinfo*/); //localPlayer should be a global variable, pending further implementation.
  }

  List<LeaderboardItem> getLeaderboard() {
    leaderboard = new List<LeaderboardItem>();
    //get all players from database, organized by score
    return leaderboard;
  }
}