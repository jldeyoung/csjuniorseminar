import 'package:flutter/material.dart';

void main() => runApp(AssassinApp());

//  TODO: Variables to be replaced with Controller
class Controller {
  static var cardinalRedSwatch = MaterialColor(0xFF791716, _cardinalColorMap);
  static var primarySwatch = cardinalRedSwatch;
  static const cardinalRed = Color(0xFF791716);
  static const primaryColor = cardinalRed;
  static const title = 'Assassin';
  static const versionDate = 'April 2020';
  static const versionCode = "1.0";
  static const homePageTitle = 'Assassin';
  static const homeBottomTabTitle = 'Home';
  static const homeBottomTabIcon = Icon(Icons.home);
  static const leaderboardBottomTabTitle = 'Leaderboard';
  static const leaderboardBottomTabIcon = Icon(Icons.format_list_numbered);
  static const feedBottomTabTitle = 'Feed';
  static const feedBottomTabIcon = Icon(Icons.format_align_justify);
  static const settingsBottomTabTitle = 'Settings';
  static const settingsBottomTabIcon = Icon(Icons.settings);
  static var username = "John Smith";

  static Map<int, Color> _cardinalColorMap =
  {
    50: Color.fromRGBO(121, 23, 22, .1),
    100: Color.fromRGBO(121, 23, 22, .2),
    200: Color.fromRGBO(121, 23, 22, .3),
    300: Color.fromRGBO(121, 23, 22, .4),
    400: Color.fromRGBO(121, 23, 22, .5),
    500: Color.fromRGBO(121, 23, 22, .6),
    600: Color.fromRGBO(121, 23, 22, .7),
    700: Color.fromRGBO(121, 23, 22, .8),
    800: Color.fromRGBO(121, 23, 22, .9),
    900: Color.fromRGBO(121, 23, 22, 1.0),
  };

  static Map<int, String> _gameNames = {
    400:"Game 1",
    1012:"Game 2",
    2431:"Game 3",
    3234:"Game 4",
    44:"Game 5",
    532:"Game 6"
  };

  static List<int> _games = [400, 1012, 2431, 3234, 44, 532];

  static Map<int, String> getGameNames() {
    return _gameNames;
  }

  static List<int> getGamesIDs() {
    return _games;
  }

  static List<LeaderboardItem> _leaderboard = [
    LeaderboardItem(1, "John Smith", 25),
    LeaderboardItem(2, "Harry Styles", 20),
    LeaderboardItem(3, "Bob Dylan", 15)
  ];

  static List<LeaderboardItem> getLeaderboard() {
    return _leaderboard;
  }

  static int _currentGame = 0;

  static int getCurrentGame() {
    return _currentGame;
  }

  static setCurrentGame(int val) {
    _currentGame = val;
  }
}

class LeaderboardItem {
  var position;
  var name;
  var points;
  LeaderboardItem(this.position, this.name, this.points);
}


class AssassinApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Controller.title,
      theme: ThemeData(
        primarySwatch: Controller.primarySwatch,
      ),
      home: AssassinHomePage(title: Controller.homePageTitle),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
              return ListTile(
                title: Text(
                  Controller.getGameNames()[Controller.getGamesIDs()[index - 1]],
                  style: TextStyle (
                    fontWeight: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1] ? FontWeight.bold : FontWeight.normal
                  ),
                ),
                trailing: Text(
                  "#${Controller.getGamesIDs()[index - 1]}",
                  style: TextStyle(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                selected: Controller.getCurrentGame() == Controller.getGamesIDs()[index - 1],
                onTap: () {
                  print("Set Current Game: ${Controller.getCurrentGame()}");
                  setState(() {
                    Controller.setCurrentGame(Controller.getGamesIDs()[index - 1]);
                  });
                  Navigator.pop(context);
                },
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
                            child: Text("OK"),
                            onPressed: () {
                              print(_gameNameTextController.text);
                              print(_gameIDTextController.text);
                              _gameNameTextController.clear();
                              _gameIDTextController.clear();
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text("CANCEL"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              _gameNameTextController.clear();
                              _gameIDTextController.clear();
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
