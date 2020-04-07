import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:io';


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

  static Map<int, String> _gamelist = {
    0:"Game 1",
    1:"Game 2",
    2:"Game 3",
    3:"Game 4",
    4:"Game 5",
    5:"Game 6"
  };

  static getGameList() {
    return _gamelist;
  }
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
  static const List<Widget> _widgetOptions = <Widget>[
    // TODO: @Sam - get mockup
    Text('Index 0: Home'),
    //  TODO: @Zach - get mockup
    Text('Index 1: Leaderboard'),
    //  TODO: @David - get mockup
    Text('Index 2: Feed'),
    Text('Index 3: Settings')
  ];

  //  Change the current widget
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            ),

            //  TODO: Move Settings to Drawer
            BottomNavigationBarItem(
              icon: Controller.settingsBottomTabIcon,
              title: Text(Controller.settingsBottomTabTitle)
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
          itemCount: Controller.getGameList().length + 3,
          itemBuilder: (BuildContext context, int index) {
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

            if (index == Controller.getGameList().length + 1){
              return const Divider();
            }

            if (index == Controller.getGameList().length + 2) {
              return AboutListTile(
                icon: Icon(Icons.info),
                applicationIcon: FlutterLogo(),
                applicationName: Controller.title,
                applicationVersion: Controller.versionCode,
                applicationLegalese: Controller.versionDate,
                dense: true,
              );
            }
            return ListTile(
              leading: Icon(Icons.accessibility),
              title: Text(Controller.getGameList()[index - 1])
            );
          },
        )
      )
    );
  }
}
