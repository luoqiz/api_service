import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoveAbleState extends StatefulWidget {
  final Function() onDragStart;
  final Function() onDragEnd;
  final Function() onDragUpdate;
  final Function(double value) onChange;
  double value;

  MoveAbleState(this.onDragStart, this.onDragEnd, this.onDragUpdate, this.onChange);


  @override
  _MoveAbleStateState createState() => _MoveAbleStateState();
}

class _MoveAbleStateState extends State<MoveAbleState> {


  void seekToRelativePosition(Offset globalPosition) {
    final box = context.findRenderObject() as RenderBox;
    final Offset tapPos = box.globalToLocal(globalPosition);
    final double relative = tapPos.dx / box.size.width;
    if (relative >= 0 && relative <= 1) {
      widget.value = relative;
      if (widget.onChange != null) {
        widget.onChange(relative);
      }
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          height: 16,
          width: 180,
          color: Colors.transparent,
          child: CustomPaint(
            painter: _ProgressBarPainter(
              widget.value,
            ),
          ),
        ),
      ),
      onHorizontalDragStart: (DragStartDetails details) {
        if (widget.onDragStart != null) {
          widget.onDragStart();
        }
      },
      onHorizontalDragUpdate: (DragUpdateDetails details) {
        seekToRelativePosition(details.globalPosition);
        if (widget.onDragUpdate != null) {
          widget.onDragUpdate();
        }
      },
      onHorizontalDragEnd: (DragEndDetails details) {
        if (widget.onDragEnd != null) {
          widget.onDragEnd();
        }
      },
      onTapDown: (TapDownDetails details) {
        seekToRelativePosition(details.globalPosition);
      },
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter(
      this.value,
      );

  double value;

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final height = 2.0;
    Paint paint = Paint();
    paint.color = Colors.black;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(size.width, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      paint,
    );
    paint.color = Colors.deepOrangeAccent;
    final double playedPart = value > 1 ? size.width : value * size.width;
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, size.height / 2),
          Offset(playedPart, size.height / 2 + height),
        ),
        Radius.circular(4.0),
      ),
      paint,
    );
    Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(playedPart, size.height / 2 + height / 2),
          radius: height * 3+1));
    canvas.drawShadow(path, Colors.black26, 1, true);
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(playedPart, size.height / 2 + height / 2),
      height * 3,
      paint,
    );
  }
}