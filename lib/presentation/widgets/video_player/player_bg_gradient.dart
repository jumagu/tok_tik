import 'package:flutter/material.dart';

class PlayerBgGradient extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const PlayerBgGradient(
      {super.key,
      this.colors = const [Colors.transparent, Colors.black87],
      this.stops = const [0.0, 1.0]})
      : assert(colors.length == stops.length,
            'Stops and Colors must be the same length.');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    stops: stops,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter))));
  }
}
