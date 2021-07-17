import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tracker/modules/home_page/menu_card.dart';
import 'package:tracker/modules/trello/trello_board.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const kTabletBreakpoint = 600;
  bool isInTabletLayout = true;

  Widget build(BuildContext context) {
    var shortestSide = MediaQuery
        .of(context)
        .size
        .shortestSide;

    if (shortestSide < kTabletBreakpoint) {
      isInTabletLayout = false;
    } else {
      isInTabletLayout = true;
    }

    var textSize = max(14.0, shortestSide / 20);

    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(child: GridView.count(
          scrollDirection: isInTabletLayout ? Axis.horizontal : Axis.vertical,
          crossAxisCount: max(2, min(shortestSide ~/ 300, 3)),
          padding: const EdgeInsets.all(20),
          children: <MenuCard>[
            MenuCard(
                text: Text('Trello', style: TextStyle(color: Colors.white, fontSize: textSize)),
                color: Colors.lightBlueAccent,
                icon: Icons.view_week,
                triggeredWidget: TrelloBoard()
            )
          ],
        ))
    );
  }
}
