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
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                const headerNum = 3;
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

                // Game selection tile
                if (index == 1) {
                  //  If there are no games, create an add games tile
                  if (Controller.getGamesIDs().length < 2) {
                    return ListTile(
                      leading: Icon(Icons.add),
                      title: Text("Add game"),
                      onTap: () async {
                        var newGameID = 0;
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
                                      Controller.setCurrentGame(newGameID);
                                      Navigator.of(context).pop();
                                    });
                                  },
                                )
                              ]
                          );
                        }
                        );
                      },
                    );
                  }

                  //  If there are 1 or more games, create a dropdown
                  return ListTile(
                    title: DropdownButton<int>(
                      value: Controller.getCurrentGame(),
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
                      selectedItemBuilder: (BuildContext context) {
                        return Controller.getGamesIDs().map<Widget>((int gameID) {
                          return Container(
                            //color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: Text("${Controller.getGameNames()[gameID]}"),
                          );
                        }).toList();
                      },
                      items: Controller.getGamesIDs().map<DropdownMenuItem<int>>((int gameID) {
                        //  Add game button
                        if(gameID == 0) {
                          return DropdownMenuItem<int>(
                            value: gameID,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.add),
                              title: Text("Add game"),
                            )
                          );
                        }

                        return DropdownMenuItem<int>(
                          value: gameID,
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(Controller.getGameNames()[gameID]),
                            subtitle: Text("#$gameID"),
                            trailing: PopupMenuButton(
                              icon: Icon(Icons.more_vert),
                              onSelected: (option) async {
                                if (option == 0) {
                                  Navigator.pop(context);
                                  await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog (
                                            title: Text("Edit game title"),
                                            content: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: TextField(
                                                controller: _gameNameTextController,
                                                decoration: InputDecoration(hintText: "Game Name"),
                                              ),
                                            ),
                                            actions: <Widget> [
                                              FlatButton(
                                                child: Text("CANCEL"),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                  _gameNameTextController.clear();
                                                },
                                              ),
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  setState(() {
                                                    var gameName =_gameNameTextController.text;
                                                    Controller.editGameName(gameID, gameName);
                                                    _gameNameTextController.clear();
                                                    Navigator.pop(context);
                                                    print("updated list");
                                                  });
                                                },
                                              )
                                            ]
                                        );
                                      }
                                  );
                                } else if (option == 1) {
                                  setState(() {
                                    Navigator.pop(context);
                                    Controller.removeGame(gameID);
                                    for (var i = 0; i < Controller.getGamesIDs().length; i++) {
                                      var val = Controller.getGamesIDs()[i];
                                      if (val != 0) {
                                        Controller.setCurrentGame(val);
                                      }
                                    }
                                  });
                                }
                              },
                              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                const PopupMenuItem(
                                  value: 0,
                                  child: Text('Edit')
                                ),
                                const PopupMenuItem(
                                  value: 1,
                                  child: Text('Remove'),
                                ),
                              ]
                            ),
                          )
                        );
                      }).toList(),
                    )
                  );
                }

                // Divider
                if (index == 2) {
                  return const Divider();
                }

                //  Home Title
                if (index == headerNum) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - headerNum ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        Controller.homeBottomTabIcon.icon,
                        color: _selectedIndex == index - headerNum ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.homeBottomTabTitle,
                        style: TextStyle(
                          color: _selectedIndex == index - headerNum ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - headerNum;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }

                //  Leaderboard Tile
                if (index == headerNum + 1) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - headerNum ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                          Controller.leaderboardBottomTabIcon.icon,
                          color: _selectedIndex == index - headerNum ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.leaderboardBottomTabTitle,
                        style: TextStyle(
                            color: _selectedIndex == index - headerNum ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - headerNum;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }

                //  Feed Tile
                if (index == headerNum + 2) {
                  return Card(
                    elevation: 0,
                    color: _selectedIndex == index - headerNum ? Controller.primaryColor.withAlpha(200) : Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                          Controller.feedBottomTabIcon.icon,
                          color: _selectedIndex == index - headerNum ? Colors.white : Colors.black54
                      ),
                      title: Text(
                        Controller.feedBottomTabTitle,
                        style: TextStyle(
                            color: _selectedIndex == index - headerNum ? Colors.white : Colors.black87
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedIndex = index - headerNum;
                          Navigator.pop(context);
                        });
                      },
                    ),
                  );
                }

                //  Create divider between screens and settings/about
                if (index == headerNum + 3){
                  return const Divider();
                }

                //  Create settings tile
                if (index == headerNum + 4) {
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