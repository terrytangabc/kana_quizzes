import 'package:flutter/material.dart';
import '../constants/Constants.dart';

// 假名列表页面
class ScriptsPage extends StatelessWidget {
  List<Widget> makeKanaList(Map<String, String> hiragana, Map<String, String> katakan) {
    var kanaList = <Widget>[];
    Widget placeholder = Container(
      alignment: Alignment.center,
    );

    hiragana.forEach((String key, String value) {
      kanaList.add(
        InkWell(
          onTap: () {
            print(value);
          },
          child: Container(
            alignment: Alignment.center,
            child: Text(
              value + ' | ' + katakan[key],
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ),
          ),
        )
      );

      if (key == 'ya' || key == 'yu') {
        kanaList.add(placeholder);
      }

      if (key == 'wa') {
        kanaList.addAll([placeholder, placeholder, placeholder]);
      }
    });
    return kanaList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          child: Row(
            children: [
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(10.0),
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 5,
                  children: makeKanaList(Constants.hiraganaBasic, Constants.katakanaBasic),
                ),
              )
            ]
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(10.0),
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 5,
                  children: makeKanaList(Constants.hiraganaVoiced, Constants.katakanaVoiced),
                ),
              ),
            ],
          )
        ),
      ]
    );
  }
}
