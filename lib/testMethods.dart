//import 'package:flutter/material.dart';
import 'package:csjuniorseminar/player.dart';

// insert methods here

void setTargets() {
    //get list of players from remote database

    //assign links between user -> target (check for cycles and repeats)

    //set currUser.targetID to appropriate value
}

void getUsers(){
  //access remote database

  //update local database/list
}

///THIS GETS CALLED BY THE GUI BUTTON.
///Member of class Player.
///It gets a question/answer pair from the remote database, makes a call to the GUI to have the user
/// answer, and compares the user's answer to their target's answer in the database.
/// Returns true and calls this.eliminatePlayer() if the answers are the same, false otherwise.
bool eliminationSuccessful() {
  /*
    int questionID = Random number generator between [1,# of icebreaker questions];
    String question = getFromDB(questionID);//Get the question with that random ID from remote DB
    String answer = getFromDB(the answer to question);
    askUser(question)
    if(askUser(question).equals(answer)){
        eliminateTarget();
        return true;
    }
    return false;
   */
  //if the user answers the question right
    eliminateTarget();
    return true;//VERSION 0 ONLY!!!
  //return false;
}

//TODO: Player.updatePlayerScore() and Player.updateTarget().

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

///Does GUI sh*t. Don't know how and don't much care for the moment.
String askUser(String question){
  //shows a prompt to the user with @param question and a text box to answer.
  //@return the answer inputted to text box.
  return "";
}