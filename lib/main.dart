import 'package:flutter/material.dart';

import 'sand_sim.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sand Simulation',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const SandSimulation(),
    );
  }
}
