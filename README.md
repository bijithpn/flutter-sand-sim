# Sand Simulation in Flutter

This project is a simple sand simulation built with Flutter, where users can "pour" sand particles that fall and settle, forming a natural, mountain-like sediment pattern. The particles fall under simulated gravity and accumulate at the bottom, creating an interactive and visually appealing effect.

## Screenshot

<video width="320" height="240" controls>
  <source src="https://raw.githubusercontent.com/bijithpn/flutter-sand-sim/d7121e7c8c9c8228cb70c37bf30f24803437794a/screenshot/video.mp4" type="video/mp4">
</video>

## Project Structure

The project has two main components:

1. **SandSimulation Widget**

   The `SandSimulation` widget is the main simulation screen, where sand particles are animated as they fall and settle. Users can add sand particles by dragging on the screen, creating an interactive and dynamic experience.

2. **SandPainter Widget**

   The `SandPainter` widget is a custom painter that renders each cell in the sand grid according to its state. This widget is responsible for drawing each particle and updating the colors to simulate sand particles as they stack and settle.

## Features

- **Dynamic Particle Simulation**: Particles fall to the bottom and stack up naturally, simulating the look and behavior of sand piling up.
- **Interactive Input**: Users can drag across the screen to add new sand particles.
- **Reset Functionality**: A button in the app bar allows users to clear the simulation and reset the grid.

## Inspiration

This project was inspired by a YouTube video tutorial by [The Coding Train](https://www.youtube.com/watch?v=L4u7Zy_b868), which explained the core mechanics of a sand simulation. In the video, The Coding Train also provided a JavaScript example of the [sand simulation](https://editor.p5js.org/codingtrain/sketches/AoH40T6fV), and this project recreates that simulation using Flutter.

## How It Works

The simulation divides the screen into a grid, where each cell can either be empty or filled with a particle. The particle movement is based on simple physics rules:

- Particles fall if there is empty space below them.
- If there is no space directly below, they will try to settle to the sides.
- Particles "pile up" naturally, simulating a sand-like effect.

## Room for Improvement

This project was built just for fun, and there's still plenty of room for optimization and performance improvements. Future versions could aim to:

- Improve the simulation speed, especially for larger grids.
- Refine particle movement for smoother transitions.
- Enhance visual effects with shading and more granular physics.

  The simulation runs on an `AnimationController`, which triggers updates to the grid at regular intervals, creating a real-time animation effect.
