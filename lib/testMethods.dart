//import 'package:flutter/material.dart';
import 'package:csjuniorseminar/LeaderboardItem.dart';
import 'package:csjuniorseminar/player.dart';

void setTargets() {
    //get list of players from remote database

    //assign links between user -> target (check for cycles and repeats)

    //set currUser.targetID to appropriate value
}

void getUsers(){
  //access remote database

  //update local database/list
}

void startGame() {
  // update database to show game in progress
  setTargets();

  //get local player info from database
  Player localPlayer = new Player(/*localplayerinfo*/);//localPlayer should be a global variable, pending further implementation.
}

List<LeaderboardItem> getLeaderboard(){
  List leaderboard = new List<LeaderboardItem>();
  //get all players from database, organized by score
  return leaderboard;
}
