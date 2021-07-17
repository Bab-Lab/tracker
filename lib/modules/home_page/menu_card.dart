import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Text text;
  final Color color;
  final IconData icon;
  final Widget triggeredWidget;

  MenuCard({
    Key? key, required this.text, required this.color, required this.icon,
    required this.triggeredWidget
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color,
        child: InkWell(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(child: FittedBox(
                      fit: BoxFit.fill,
                      child: Icon(icon, color: text.style!.color)
                  )),
                  Padding(padding: const EdgeInsets.all(2), child: text)
                ]
            ),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scaffold(
                  appBar: AppBar(title: text, backgroundColor: color),
                  body: triggeredWidget,
                )))
        )
    );
  }
}