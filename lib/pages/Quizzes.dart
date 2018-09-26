import 'package:flutter/material.dart';
import './Cards.dart';

// 假名列表页面
class QuizzesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          color: Colors.orangeAccent,
          margin: const EdgeInsets.all(16.0),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 26.0),
            child: ListTile(
              leading: const Icon(Icons.swap_horizontal_circle),
              title: const Text('Cards'),
              subtitle: const Text('Improve Your Memory of Kana'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Cards()));
              },
            ),
          )
        ),
        Card(
          color: Colors.lightGreen,
          margin: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            contentPadding: const EdgeInsets.only(left: 26.0),
            child: ListTile(
              leading: const Icon(Icons.event_note),
              title: const Text('Dictations'),
              subtitle: const Text('Practice Your Listening and Writing'),
              onTap: () {
                print(this);
              },
            ),
          ),
        ),
      ],
    );
  }
}
