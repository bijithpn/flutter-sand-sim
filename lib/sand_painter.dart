import 'package:flutter/widgets.dart';

class SandPainter extends CustomPainter {
  SandPainter(this.grid, this.cellSize);

  final int cellSize;
  final List<List<int>> grid;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    for (int i = 0; i < grid.length; i++) {
      for (int j = 0; j < grid[i].length; j++) {
        if (grid[i][j] > 0) {
          paint.color =
              HSVColor.fromAHSV(1, grid[i][j].toDouble(), 1, 1).toColor();
          canvas.drawRect(
            Rect.fromLTWH(i * cellSize.toDouble(), j * cellSize.toDouble(),
                cellSize.toDouble(), cellSize.toDouble()),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
