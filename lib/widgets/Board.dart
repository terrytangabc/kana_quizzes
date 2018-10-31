import 'package:flutter/material.dart';
import 'dart:async';

class Board extends StatefulWidget {
  final PainterController painterController;

  Board(this.painterController):
        super(key: new ValueKey<PainterController>(painterController));

  @override
  _BoardState createState() => new _BoardState();
}

class _BoardState extends State<Board> {
  final Path _curPath = new Path();

  @override
  Widget build(BuildContext context) {
    Widget customPaint = ClipRect(
      child: CustomPaint(
        willChange: true,
        painter: new Painter(_curPath, widget.painterController),
      ),
    );

    return Expanded(
      child: GestureDetector(
          child: customPaint,
          onPanStart: _onPanStart,
          onPanUpdate: _onPanUpdate,
          onPanEnd: _onPanEnd,
        ),
    );
  }

  void _onPanStart (DragStartDetails start) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(start.globalPosition);

    _curPath.moveTo(pos.dx, pos.dy);
    widget.painterController._notifyListeners();
  }

  void _onPanUpdate (DragUpdateDetails update) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(update.globalPosition);

    _curPath.lineTo(pos.dx, pos.dy);
    widget.painterController._notifyListeners();
  }

  void _onPanEnd (DragEndDetails end) {
    new Timer(const Duration(seconds: 1), (){
      print('timer');
    });
    widget.painterController._notifyListeners();
  }
}

class Painter extends CustomPainter {
  final Path _curPath;

  Painter(this._curPath, Listenable repaint):super(repaint: repaint);

  @override
  void paint (Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.lightGreen;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 4.0;
    canvas.drawPath(_curPath, paint);
  }

  @override
  bool shouldRepaint (Painter oldDelegate) {
    return true;
  }

}

class PainterController extends ChangeNotifier {
  void _notifyListeners () {
    notifyListeners();
  }
}