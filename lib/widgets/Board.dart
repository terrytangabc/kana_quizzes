import 'package:flutter/material.dart';
import 'dart:async';

class Board extends StatelessWidget {
  final PainterController painterController;

  Board(this.painterController):
        super(key: new ValueKey<PainterController>(painterController));

  @override
  Widget build(BuildContext context) {
    Widget customPaint = ClipRect(
      child: CustomPaint(
        willChange: true,
        painter: new Painter(painterController),
      ),
    );

    return Expanded(
      child: GestureDetector(
        child: customPaint,
        onPanStart: (DragStartDetails start) {
          painterController._panStart(start, context);
        },
        onPanUpdate: (DragUpdateDetails update) {
          painterController._panUpdate(update, context);
        },
        onPanEnd: (DragEndDetails end) {
          painterController._panEnd(end, context);
        },
      ),
    );
  }

}

class Painter extends CustomPainter {
  PainterController repaint;

  Painter(this.repaint):super(repaint: repaint);

  @override
  void paint (Canvas canvas, Size size) {
    repaint._draw(canvas, size);
  }

  @override
  bool shouldRepaint (Painter oldDelegate) {
    return true;
  }
}

class PainterController extends ChangeNotifier {
  final VoidCallback randomPlay;
  final Function setKanaVisibility;
  final Path _curPath = new Path();
  bool isShowKana = false;
  Timer _timer;

  PainterController({this.randomPlay, this.setKanaVisibility});

  void stopTimerAndClear () {
    _timer?.cancel();
    _curPath.reset();
    _notifyListeners();
  }

  void _panStart (DragStartDetails start, BuildContext context) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(start.globalPosition);

    _timer?.cancel();
    _curPath.moveTo(pos.dx, pos.dy);
    _notifyListeners();
  }

  void _panUpdate (DragUpdateDetails update, BuildContext context) {
    Offset pos = (context.findRenderObject() as RenderBox)
        .globalToLocal(update.globalPosition);

    _curPath.lineTo(pos.dx, pos.dy);
    _notifyListeners();
  }

  void _panEnd (DragEndDetails end, BuildContext context) {
    // show the answer when user stops painting for 1s
    _timer = new Timer(const Duration(milliseconds: 1000), () {
      setKanaVisibility(true);

      // go to next kana after the answer has been shown for 1s
      new Timer(const Duration(milliseconds: 1000), () {
        _reset();
      });
    });
  }

  void _draw (Canvas canvas, Size size) {
    Paint paint = new Paint();
    paint.color = Colors.lightGreen;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 8.0;
    canvas.drawPath(_curPath, paint);
  }

  void _reset  () {
    _curPath.reset();
    _notifyListeners();
    setKanaVisibility(false);
    randomPlay();
  }

  void _notifyListeners () {
    notifyListeners();
  }
}