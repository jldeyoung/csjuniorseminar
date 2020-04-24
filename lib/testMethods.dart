//import 'package:flutter/material.dart';
import 'package:csjuniorseminar/LeaderboardItem.dart';
import 'package:csjuniorseminar/player.dart';
import 'package:firebase_dart/firebase_dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void setTargets() {
    //get list of players from remote database

    //assign links between user -> target (check for cycles and repeats)

    //set currUser.targetID to appropriate value
}
void getUsers() async {
  final databaseReference = Firestore.instance; //code prints all users
  databaseReference.collection('players')
  .getDocuments()
      .then((QuerySnapshot snapshot) {
    snapshot.documents.forEach((f) => print('${f.data}}'));
  });

}

void startGame() async {
  //gameOver = false;// update database to show game in progress
  setTargets();
  final databaseReference = Firestore.instance;
  DocumentReference ref = await databaseReference.collection('players')
    .add({
    'Email' : 'whatever',
    'Games Played' : 0,
    'Highest Rank' : 0,
    'Life time points' : 0,
    'password' : 'pw',
    'Points' : 0,
    'Real Name': 'name',
    'Username' : 'tplayer'
  });
  //get local player info from database
  //Player localPlayer = new Player(/*localplayerinfo*/);//localPlayer should be a global variable, pending further implementation.
}

List<LeaderboardItem> getLeaderboard(){
  List leaderboard = new List<LeaderboardItem>();
  //get all players from database, organized by score
  return leaderboard;
}