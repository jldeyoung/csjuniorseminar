//import 'package:flutter/material.dart';
import 'package:csjuniorseminar/LeaderboardItem.dart';
import 'package:csjuniorseminar/player.dart';

///The Game class represents a single instance of a game. It contains the list
///of players and has a unique ID, as well as indicates which user is the game
///administrator (by ID).
class Game {
  int gameID;
  int adminID;
  List<LeaderboardItem> leaderboard;
  bool gameOver;

  ///When calling this constructor, use the PlayerID of whoever is creating the
  ///game (aID) and the new gameID from the database (gID).
  Game(int gID, int aID){
    gameID = gID;
    adminID = aID;
  }

  ///This method sets the initial list of targets based on the available Players
  ///in the database.
  void setTargets() {
    //get list of players from remote database

    //assign links between user -> target (check for cycles and repeats)

    //set localPlayer.targetID to appropriate value
  }

  ///This method updates the local list of other players in the game.
  ///(Is this the leaderboard?)
  void getUsers() {
    //access remote database

    //update local database/list
  }

  ///This method indicates that the game has started, and updates the localPlayer
  ///variable, getting information from the database(should it need to? Local
  ///player information can be created and stored locally.).
  //when adding a Player to a game: if(gameOver){return;}
  void startGame() {
    gameOver = false;// update database to show game in progress
    setTargets();
    //get local player info from database
    //Player localPlayer = new Player(/*localplayerinfo*/); //localPlayer should be a global variable, pending further implementation.
  }

  ///This method retrieves the most up-to-date leaderboard information from the
  ///database, sorted by score.
  List<LeaderboardItem> getLeaderboard() {
    leaderboard = new List<LeaderboardItem>();
    //get all players from database, organized by score
    return leaderboard;
  }

  ///getter methods
  int getGameID()=>gameID;
  int getAdminID()=>adminID;
  bool isGameOver()=>gameOver;
}