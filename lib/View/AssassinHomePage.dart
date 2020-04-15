import 'package:flutter/material.dart';

// UI Imports
import 'package:csjuniorseminar/View/Controller.dart';
import 'package:csjuniorseminar/View/HomePage.dart';
import 'package:csjuniorseminar/View/LeaderboardPage.dart';
import 'package:csjuniorseminar/View/FeedPage.dart';

class AssassinHomePage extends StatefulWidget {
  //  Constructor
  AssassinHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AssassinHomePageState createState() => _AssassinHomePageState();
}



class _AssassinHomePageState extends State<AssassinHomePage> {
  //  Current selected widget
  int _selectedIndex = 0;

  //  List of possible widgets
  static List<Widget> _widgetOptions = <Widget>[
    // TODO: @Sam - get mockup
    HomePage(),
    LeaderboardPage(),
    //  TODO: @David - get mockup
    FeedPage(),
  ];

  final _gameIDTextController = TextEditingController();
  final _gameNameTextController = TextEditingController();

  // Called on setState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        drawer: Drawer(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                //  Variables
                var currentGame = Controller.getCurrentGame();

                //  Create header
                if (index == 0) {
                  return DrawerHeader(
                    decoration: BoxDecoration(
                        color: Controller.primaryColor
                    ),
                    child: Text(
                        Controller.username,
                        style:TextStyle(
                            color: Colors.white,
                            fontSize: 24
                        )
                    ),
                  );
                }

                var dropdownValue = Controller.getCurrentGame();
                var dropdownGameIDs = Controller.getGamesIDs();
                var dropdownGameNames = Controller.getGameNames();

                if (index == 1) {
                  return ListTile(
                    title: DropdownButton<int>(
                      value: dropdownValue,
                      isExpanded: true,

                      onChanged: (int newGameID) async {
                        if (newGameID == 0) {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog (
                                    title: Text("Add a new game"),
                                    content: Container(
                                      height: 116,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                            children: [
                                              TextField(
                                                controller: _gameNameTextController,
                                                decoration: InputDecoration(hintText: "Game Name"),
                                              ),
                                              TextField (
                                                controller: _gameIDTextController,
                                                decoration: InputDecoration(hintText: "Game ID"),
                                              )
                                            ]
                                        ),
                                      ),
                                    ),

                                    actions: <Widget> [
                                      FlatButton(
                                        child: Text("CANCEL"),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          _gameNameTextController.clear();
                                          _gameIDTextController.clear();
                                        },
                                      ),
                                      FlatButton(
                                        child: Text("OK"),
                                        onPressed: () {
                                          setState(() {
                                            var gameName =_gameNameTextController.text;
                                            newGameID = int.parse(_gameIDTextController.text);
                                            Controller.addGame(newGameID, gameName);
                                            _gameNameTextController.clear();
                                            _gameIDTextController.clear();
                                            Navigator.of(context).pop();
                                          });
                                        },
                                      )
                                    ]
                                );
                              }
                          );
                        }

                        //  Update button with that option
                        setState(() {
                          if (newGameID != 0) {
                            Controller.setCurrentGame(newGameID);
                            Navigator.pop(context);
                          }
                        });
                      },
                      items: dropdownGameIDs.map<DropdownMenuItem<int>>((int gameID) {
                        //  Add game button
                        if(gameID == 0) {
                          return DropdownMenuItem<int>(
                              value: gameID,
                              child: Container(
                                  padding: EdgeInsets.all(0),
                                  child: Row(
                                      children: <Widget>[
                                        Icon(Icons.add),
                                        Text("Add game")
                                      ]
                                  )
                              )
                          );
                        }

                        return DropdownMenuItem<int>(
                          value: gameID,
                          child: Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(dropdownGameNames[gameID]),
                                ),
                                Expanded (
                                  child: Text(
                                    "#$gameID",
                                    textAlign: TextAlign.right,
                                  ),
                                )
                              ]
                            ),
                          )
                        );
                      }).toList(),
                    )
                  );

                }

                //  Home Title
                if (index == 2) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - 2 ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        Controller.homeBottomTabIcon.icon,
                        color: _selectedIndex == index - 2 ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.homeBottomTabTitle,
                        style: TextStyle(
                          color: _selectedIndex == index - 2 ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - 2;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }

                //  Leaderboard Tile
                if (index == 3) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - 2 ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                          Controller.leaderboardBottomTabIcon.icon,
                          color: _selectedIndex == index - 2 ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.leaderboardBottomTabTitle,
                        style: TextStyle(
                            color: _selectedIndex == index - 2 ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - 2;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }

                //  Feed Tile
                if (index == 4) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - 2 ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                          Controller.feedBottomTabIcon.icon,
                          color: _selectedIndex == index - 2 ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.feedBottomTabTitle,
                        style: TextStyle(
                            color: _selectedIndex == index - 2 ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - 2;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }
                //  Create divider between screens and settings/about
                if (index == 5){
                  return const Divider();
                }

                //  Create settings tile
                if (index == 6) {
                  return ListTile(
                    leading: Controller.settingsBottomTabIcon,
                    title: Text(Controller.settingsBottomTabTitle),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  );
                }

                //  Create about tile
                return AboutListTile(
                  icon: Icon(Icons.info),
                  applicationIcon: FlutterLogo(),
                  applicationName: Controller.title,
                  applicationVersion: Controller.versionCode,
                  applicationLegalese: Controller.versionDate,
                  dense: true,
                );
              },
            )
        )
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}