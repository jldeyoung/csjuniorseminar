import 'package:flutter/material.dart';

// UI Imports
import 'package:csjuniorseminar/View/Controller.dart';


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
    Text('Index 0: Home'),
    //  TODO: @Zach - get mockup
    ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: Controller.getLeaderboard().length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("${Controller.getLeaderboard()[index].position}. ${Controller.getLeaderboard()[index].name}"),
          trailing: Text("${Controller.getLeaderboard()[index].points} points"),
        );
      },
      separatorBuilder: (BuildContext, int index) {
        return Divider();
      },
    ),
    //  TODO: @David - get mockup
    Text('Index 2: Feed'),
  ];

  //  Change the current widget
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem> [
            // Home
            BottomNavigationBarItem(
              icon: Controller.homeBottomTabIcon,
              title: Text(Controller.homeBottomTabTitle),
            ),

            //  Leaderboard
            BottomNavigationBarItem(
                icon: Controller.leaderboardBottomTabIcon,
                title: Text(Controller.leaderboardBottomTabTitle)
            ),

            //  Feed
            BottomNavigationBarItem(
                icon: Controller.feedBottomTabIcon,
                title: Text(Controller.feedBottomTabTitle)
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
        ),
        drawer: Drawer(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: Controller.getGamesIDs().length + 4,
              itemBuilder: (BuildContext context, int index) {

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

                //  Create game tiles
                if (index < Controller.getGamesIDs().length + 1) {
                  return Card (
                      elevation: 0,
                      color: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1] ? Controller.primaryColor.withAlpha(64) : Colors.transparent,
                      child: ListTile(
                        title: Text(
                          Controller.getGameNames()[Controller.getGamesIDs()[index - 1]],
                          style: TextStyle (
                              fontWeight: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1] ? FontWeight.bold : FontWeight.normal,
                              color: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1] ? Controller.primaryColor : Colors.black87
                          ),
                        ),
                        trailing: Text(
                          "#${Controller.getGamesIDs()[index - 1]}",
                          style: TextStyle(
                            color: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1] ? Controller.primaryColor : Colors.black54,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        selected: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1],
                        onTap: () {
                          setState(() {
                            Controller.setCurrentGame(Controller.getGamesIDs()[index - 1]);
                            print("Set Current Game: ${Controller.getCurrentGame()}");
                          });
                          Navigator.pop(context);
                        },
                      )
                  );
                }

                //  Create "Add game" tile
                if (index < Controller.getGamesIDs().length + 2) {
                  return ListTile(
                    leading: Icon(Icons.add),
                    title: Text("Add game"),
                    onTap: () {
                      showDialog(
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
                                        var gameID = _gameIDTextController.text;
                                        Controller.addGame(int.parse(gameID), gameName);
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

                    },
                  );
                }

                //  Create divider between add and about tiles
                if (index < Controller.getGamesIDs().length + 3){
                  return const Divider();
                }

                //  Create settings tile
                if (index < Controller.getGamesIDs().length + 4) {
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