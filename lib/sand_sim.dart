import 'dart:math';
import 'package:flutter/material.dart';
import 'sand_painter.dart';

class SandSimulation extends StatefulWidget {
  const SandSimulation({super.key});

  @override
  State<SandSimulation> createState() => _SandSimulationState();
}

class _SandSimulationState extends State<SandSimulation>
    with SingleTickerProviderStateMixin {
  final int cellSize = 5;
  late AnimationController controller;
  List<List<int>> grid = [];
  int hueValue = 200;
  Random random = Random();
  late int cols, rows;
  // Limit the simulation to 50% of screen height
  double visibleHeightFactor = 0.5;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    )..addListener(updateSim);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      cols = ((size.width * visibleHeightFactor) / cellSize).floor();
      rows = ((size.height * visibleHeightFactor) / cellSize).floor();
      grid = initializeSim();
      controller.repeat();
    });
  }

  bool checkinBounds(int i, int j) {
    return i >= 0 && i < cols && j >= 0 && j < rows;
  }

  List<List<int>> initializeSim() {
    return List.generate(cols, (_) => List.generate(rows, (_) => 0));
  }

  void updateSim() {
    List<List<int>> nextGrid = initializeSim();
    for (int i = 0; i < cols; i++) {
      for (int j = rows - 1; j >= 0; j--) {
        int state = grid[i][j];
        if (state > 0) {
          if (j < rows - 1 && grid[i][j + 1] == 0) {
            nextGrid[i][j + 1] = state;
          } else if (j < rows - 1 && grid[i][j + 1] > 0) {
            nextGrid[i][j] = state;
          } else {
            nextGrid[i][j] = state;
          }
        }
      }
    }
    setState(() {
      grid = nextGrid;
    });
  }

  void onDrag(DragUpdateDetails details) {
    int col = (details.localPosition.dx / cellSize).floor();
    int row = (details.localPosition.dy / cellSize).floor();
    int matrixSize = 5;
    int extent = matrixSize ~/ 2;

    for (int i = -extent; i <= extent; i++) {
      for (int j = -extent; j <= extent; j++) {
        if (random.nextDouble() < 0.75) {
          int x = col + i;
          int y = row + j;
          if (checkinBounds(x, y)) {
            setState(() {
              grid[x][y] = hueValue;
            });
          }
        }
      }
    }

    hueValue = (hueValue + 1) % 360;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Sand Simulation'),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    grid = initializeSim();
                  }),
              icon: const Icon(Icons.clear_all_outlined))
        ],
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: GridPaper(
              child: CustomPaint(
                size: Size(
                  MediaQuery.of(context).size.width * visibleHeightFactor,
                  MediaQuery.of(context).size.height * visibleHeightFactor,
                ),
                painter: SandPainter(grid, cellSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
