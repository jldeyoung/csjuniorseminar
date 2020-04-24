import 'package:flutter/material.dart';

// UI Imports
import 'package:csjuniorseminar/View/Controller.dart';

Widget LeaderboardPage() {
  return ListView.separated(
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
  );
}