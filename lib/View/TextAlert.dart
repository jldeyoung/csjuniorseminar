//import 'package:flutter/material.dart';
//
//class TextAlert extends StatelessWidget {
//
//  Future<String> showTextAlert(BuildContext context) async {
//    final _gameIDTextController = TextEditingController();
//    final _gameNameTextController = TextEditingController();
//    await showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog (
//              title: Text("Add a new game"),
//              content: Container(
//                height: 116,
//                child: Padding(
//                  padding: const EdgeInsets.all(10),
//                  child: Column(
//                      children: [
//                        TextField(
//                          controller: _gameNameTextController,
//                          decoration: InputDecoration(hintText: "Game Name"),
//                        ),
//                        TextField (
//                          controller: _gameIDTextController,
//                          decoration: InputDecoration(hintText: "Game ID"),
//                        )
//                      ]
//                  ),
//                ),
//              ),
//
//              actions: <Widget> [
//                FlatButton(
//                  child: Text("CANCEL"),
//                  onPressed: () {
//                    Navigator.of(context).pop();
//                    _gameNameTextController.clear();
//                    _gameIDTextController.clear();
//                  },
//                ),
//                FlatButton(
//                  child: Text("OK"),
//                  onPressed: () {
//                    setState(() {
//                      var gameName =_gameNameTextController.text;
//                      newGameID = int.parse(_gameIDTextController.text);
//                      Controller.addGame(newGameID, gameName);
//                      _gameNameTextController.clear();
//                      _gameIDTextController.clear();
//                      Navigator.of(context).pop();
//                    });
//                  },
//                )
//              ]
//          );
//        }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Text("implement");
//  }
//}
