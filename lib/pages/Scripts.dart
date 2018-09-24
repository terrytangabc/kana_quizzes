import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import '../constants/Constants.dart';

// Kana scripts page
class ScriptsPage extends StatelessWidget {
  // init audio player
  final AudioCache player = new AudioCache(prefix: 'audios/');

  // make children for SliverGrid.count
  List<Widget> makeKanaList(Map<String, String> hiragana, Map<String, String> katakana) {
    var kanaList = <Widget>[];

    // placeholder for line 'ya' and 'wa'
    Widget placeholder = Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 0.5)
    ),);

    hiragana.forEach((String key, String value) {
      kanaList.add(
        InkWell(
          onTap: () {
            player.play(key + '.mp3');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12, width: 0.5)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  value + ' | ' + katakana[key],
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 18.0,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(key),
                ),
              ],
            ),
          ),
        )
      );

      // insert placeholder for line 'ya' and 'wa'
      if (key == 'ya' || key == 'yu') {
        kanaList.add(placeholder);
      }

      if (key == 'wa') {
        kanaList.addAll([placeholder, placeholder, placeholder]);
      }
    });
    return kanaList;
  }

  // make titles for three types of kana
  SliverFixedExtentList makeKanaTitle(String titleStr) {
    var title = <Widget>[
      Container(
        alignment: Alignment.center,
        child: Text(
          titleStr,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ];

    return new SliverFixedExtentList(
        delegate: new SliverChildListDelegate(title),
        itemExtent: 48.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeKanaTitle('Basic'),
        new SliverGrid.count(
          crossAxisCount: 5,
          childAspectRatio: 1.2,
          children: makeKanaList(Constants.hiraganaBasic, Constants.katakanaBasic),
        ),
        makeKanaTitle('Voiced'),
        new SliverGrid.count(
          crossAxisCount: 5,
          childAspectRatio: 1.2,
          children: makeKanaList(Constants.hiraganaVoiced, Constants.katakanaVoiced),
        ),
        makeKanaTitle('Combo'),
        new SliverGrid.count(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          children: makeKanaList(Constants.hiraganaCombo, Constants.katakanaCombo),
        ),
      ],
    );
  }
}
