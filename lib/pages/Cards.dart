import 'package:flutter/material.dart';
import '../constants/Constants.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Cards extends StatelessWidget {
  Widget makeItems (BuildContext context, int index) {
    return Container(
      child: new Text(Constants.hiraganaBasicFor[index]['roman']),
    );
  }

  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      body: new TransformerPageView(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          return makeItems(context, index);
        },
      )
    );
  }
}