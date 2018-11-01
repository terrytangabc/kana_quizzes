import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'dart:math';
import '../constants/Constants.dart';
import '../widgets/Board.dart';

class Dictations extends StatefulWidget {
  @override
  _DictationsState createState () => new _DictationsState();
}

class _DictationsState extends State<Dictations> {
  final AudioCache player = new AudioCache(prefix: 'audios/');
  bool isShowKana = false;
  Map<String, String> curKana;
  PainterController painterController;
  KanaType checkedPopMenuItem;

  //  create PainterController instance and pass parameters to it
  createPainter () {
    PainterController newController = new PainterController(
        randomPlay: randomPlay,
        setKanaVisibility: (bool isShow) {
          setState(() {
            isShowKana = isShow;
          });
    });
    return newController;
  }

  @override
  void initState() {
    super.initState();
    checkedPopMenuItem = KanaType.hiragana;
    painterController = createPainter();
    randomPlay();
  }

  // play audio of a random hiragana or katakana
  void randomPlay () {
    var _list = <Map<String, String>>[];

    if (checkedPopMenuItem == KanaType.hiragana) {
      _list.addAll(Constants.getFormattedList(Constants.hiraganaBasic));
      _list.addAll(Constants.getFormattedList(Constants.hiraganaVoiced));
      _list.addAll(Constants.getFormattedList(Constants.hiraganaCombo));
    } else {
      _list.addAll(Constants.getFormattedList(Constants.katakanaBasic));
      _list.addAll(Constants.getFormattedList(Constants.katakanaVoiced));
      _list.addAll(Constants.getFormattedList(Constants.katakanaCombo));
    }

    final _randomIndex = new Random();
    setState(() {
      curKana = _list[_randomIndex.nextInt(_list.length)];
    });
    player.play(curKana['roman'] + '.mp3');
  }

  Widget buildControlBar () {
    return Container(
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.black12, offset: Offset(0.0, 1.0), blurRadius: 2.0)],
          color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MaterialButton(
            height: 58.0,
            onPressed: () {
              player.play(curKana['roman'] + '.mp3');
            },
            child: Icon(Icons.volume_up),
          ),

          Opacity(
            opacity: isShowKana ? 1.0 : 0.0,
            child: Container(
              width: 80.0,
              alignment: Alignment.center,
              child: Text(
                curKana['character'] ?? '',
                style: TextStyle(
                  color: Colors.lightGreen,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          MaterialButton(
            height: 58.0,
            onPressed: () {
              setState(() {
                painterController.stopTimerAndClear();
              });
            },
            child: Icon(Icons.autorenew),
          ),
        ]
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Dictations'),
        actions: <Widget>[
          PopupMenuButton<KanaType>(
            onSelected: (KanaType res) {
              setState(() {
                checkedPopMenuItem = res;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<KanaType>>[
              CheckedPopupMenuItem<KanaType>(
                checked: checkedPopMenuItem == KanaType.hiragana,
                value: KanaType.hiragana,
                child: const Text('hiragana'),
              ),
              const PopupMenuDivider(),
              CheckedPopupMenuItem<KanaType>(
                checked: checkedPopMenuItem == KanaType.katakana,
                value: KanaType.katakana,
                child: const Text('katakana'),
              ),
              // ...other items listed here
            ],
          )
        ],
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