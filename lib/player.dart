//import 'package:flutter/material.dart';

// Player class for logic testing

class Player {
  int playerID;
  int targetID;
  String realName;
  String username;
  bool isEliminated;
  bool isTargeted;
  bool inGame;
  int score;

  Player(pID,tID,rn,un,isE,isT)
  {
    this.playerID = pID;
    this.targetID = tID;
    this.realName = rn;
    this.username = un;
    this.isEliminated = isE;
    this.isTargeted = isT;
    score = 0;
    inGame = false;
  }

  ///THIS GETS CALLED BY THE GUI BUTTON.
  ///Member of class Player.
  ///It gets a question/answer pair from the remote database, makes a call to the GUI to have the user
  /// answer, and compares the user's answer to their target's answer in the database.
  /// Returns true and calls this.eliminatePlayer() if the answers are the same, false otherwise.
  bool eliminationSuccessful() {
    int questionID; //= Random number generator between [1,# of icebreaker questions];
    String question;// = getFromDB(questionID);//Get the question with that random ID from remote DB
    String answer;// = getFromDB(the answer to question);
    askUser(question);
    if(identical(askUser(question),(answer))){
        eliminateTarget();
        return true;
    }
    return false;
  }

  ///Updates the current player's score.
  ///Version 0: add 10 points, exact scoring mechanics to be determined and implemented.
  void updatePlayerScore(){
    score += 10;
  }

  ///Find the previous target's target(s) and give them to the current player.
  void updateTarget(){
    Player oldTarget; //= getFromDB(targetID);
    targetID = oldTarget.targetID;
  }

  ///member of class Player
  ///Sets getFromDB(this.targetID).isEliminated to true
  ///Updates this.score
  ///Gets this player a new target.
  void eliminateTarget() {
    updatePlayerScore();
    updateTarget();
    //get this.targetID from remote DB
    //set the target's isEliminated=true;
  }

  ///Does GUI things. @GUI team please implement
  String askUser(String question){
    //shows a prompt to the user with @param question and a text box to answer.
    //@return the answer inputted to text box.
    return "";
  }


  //------------Getters and Setters-------------

  // returns 0 if in game
  // 1 if eliminated from game
  // 2 if out of game(game hasn't started yet
  int getPlayerStatus() {
    if (inGame) {
      if (!isEliminated)
        {
          return 0;
        }
      return 1;
    }
    return 2;
  }

  void setPlayerScore(int sc) {
    score = sc;
  }
  int getPlayerScore() => this.score;


  void setPlayerName(String name) {
    username = name;
  }
  String getPlayerHame() => this.username;

  void startGame() {
    inGame = true;
  }
  void endGame() {
    inGame = false;
  }

}