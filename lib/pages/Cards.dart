import 'package:flutter/material.dart';
import '../constants/Constants.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Cards extends StatefulWidget {
  @override
  _CardsState createState() => new _CardsState();
}

class _CardsState extends State<Cards> {
  var _itemList = <Map<String, String>>[];
  var _curIndex = 0;

  Widget _buildCards (BuildContext context) {
    _itemList.addAll(_getShuffledList());
    return new TransformerPageView(
      itemCount: _itemList.length,
      index: _curIndex,
      itemBuilder: (BuildContext context, int index) {
        return CardsItem(_itemList[index]['roman'], _itemList[index]['character'], key: ObjectKey(index));
      },
      onPageChanged: (int index) {
        if (index == _itemList.length - 1 ) {
          setState(() {
            _curIndex = index;
          });
        }
      },
    );
  }

  List<Map<String, String>> _getShuffledList () {
    var _list = <Map<String, String>>[];
    _list.addAll(Constants.getFormattedList(Constants.hiraganaBasic));
    _list.addAll(Constants.getFormattedList(Constants.hiraganaVoiced));
    _list.addAll(Constants.getFormattedList(Constants.hiraganaCombo));
    _list.addAll(Constants.getFormattedList(Constants.katakanaBasic));
    _list.addAll(Constants.getFormattedList(Constants.katakanaVoiced));
    _list.addAll(Constants.getFormattedList(Constants.katakanaCombo));
    _list.shuffle();
    return _list;
  }

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: _buildCards(context)
    );
  }
}

class CardsItem extends StatefulWidget {
  CardsItem(this.roman, this.character, {Key key}) : super(key: key);

  final String roman;
  final String character;

  @override
  _CardsItemState createState() => new _CardsItemState();
}

class _CardsItemState extends State<CardsItem> {
  var _romanVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (detail) {
        setState(() {
          _romanVisible = true;
        });
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Container(
            margin: orientation == Orientation.portrait ?
              EdgeInsets.symmetric(vertical: 150.0, horizontal: 50.0) :
              EdgeInsets.symmetric(vertical: 30.0, horizontal: 200.0),
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: <BoxShadow>[BoxShadow(color: Colors.black54,
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Opacity(
                  opacity: _romanVisible ? 1.0 : 0.0,
                  child: Text(
                    widget.roman, style: TextStyle(fontSize: 64.0),),
                ),
                new Text(widget.character, style: TextStyle(fontSize: 88.0),),
              ],
            ),
          );
        }
      ),
    );
  }
}
