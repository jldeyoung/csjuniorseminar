//import 'package:flutter/material.dart';
//import 'dart:collection';
import 'dart:math';

// Player class for logic testing

class Player {
  static final Set<String> _questions = {"What is your favorite color?",
                                        "How many pets do you have?",
                                        "What's your favorite number?"}; //TODO: generate this list from the remote DB
  static final Set<String> _answers = {"red", "7", "pi"};//TODO: generate this list from the remote DB
  Map<String, String> _answerMap = Map.fromIterables(_questions, _answers);
  // ignore: non_constant_identifier_names
  final int NUMBER_OF_QUESTIONS = _questions.length;

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

  ///Gets the object with whatever @param id from the remote database.
  ///Version 0 returns from the list literal above.
  String getQuestionFromDB(int id){
    return _questions.elementAt(id);
  }

  String getAnswerFromDB(int id){
    return _answerMap[id];
  }

  ///Gets the Player at @param id from the remote database.
  ///Version 0 returns a dummy Player.
  Player getPlayerFromDB(int id) {
    //TODO: get this implementation from database team
    return new Player(-2, -1, "John Doe", "jdoe", false, true);
  }

  ///THIS GETS CALLED BY THE GUI BUTTON.
  ///Member of class Player.
  ///It gets a question/answer pair from the remote database, makes a call to the GUI to have the user
  /// answer, and compares the user's answer to their target's answer in the database.
  /// Returns true and calls this.eliminatePlayer() if the answers are the same, false otherwise.
  bool eliminationSuccessful() {
    Random rnd = new Random();
    int questionID = rnd.nextInt(NUMBER_OF_QUESTIONS); //Random number between [0,NUMBER_OF_QUESTIONS], inclusive.
    String question = getQuestionFromDB(questionID);//Get the question with that random ID from remote DB
    String answer = getAnswerFromDB(questionID);
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
    Player oldTarget = getPlayerFromDB(targetID);
    this.targetID = oldTarget.targetID;//change target to target's target.
    oldTarget.setPlayerStatus(true);//set the target's isEliminated=true;
  }

  ///member of class Player
  ///Updates this.score
  ///Gets this player a new target.
  void eliminateTarget() {
    updatePlayerScore();
    updateTarget();
  }

  ///Does GUI things. @GUI team please implement
  String askUser(String question){
    //shows a prompt to the user with @param question and a text box to answer.
    //@return the answer inputted to text box.
    return "";
  }

  void setPlayerStatus(bool status) {
    isEliminated = status;
  }

  /// returns 0 if active
  /// 1 if eliminated
  /// 2 if game hasn't started yet
  int getPlayerStatus() {
  if (inGame) {
      if (!isEliminated) {
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
  String getPlayerName() => username;
  
  void startGame() {
    inGame = true;
  }
  void endGame() {
    inGame = false;
  }

}