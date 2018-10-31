import 'package:flutter/material.dart';
import '../widgets/Board.dart';

class Dictations extends StatefulWidget {
  @override
  _DictationsState createState () => new _DictationsState();
}

class _DictationsState extends State<Dictations> {
  PainterController painterController = new PainterController();

  initBoard () {
    PainterController newController = new PainterController();
    return newController;
  }

  Widget buildControlBar () {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, offset: Offset(0.0, 1.0), blurRadius: 2.0)],
          color: Colors.white
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print('play audio');
              },
              child: new Icon(Icons.volume_up),
            ),
            Text('あ', style: new TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
            GestureDetector(
              onTap: () {
                setState(() {
                  painterController = initBoard();
                });
              },
              child: new Icon(Icons.autorenew),
            )
          ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Dictations'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildControlBar(),
            Board(painterController)
          ],
        ),
      ),
    );
  }
}