import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Xylophone(),
      ),
    );
  }
}

class Xylophone extends StatelessWidget {
  const Xylophone({Key? key}) : super(key: key);

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('c$soundNumber.wav'));
  }

  Expanded buildKey({
    required int soundNumber,
    required Color color,
    required String note,
  }) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () => playSound(soundNumber),
        child: Text(
          note,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildKey(soundNumber: 1, color: Colors.red,    note: 'C1'),
          buildKey(soundNumber: 2, color: Colors.orange, note: 'D1'),
          buildKey(soundNumber: 3, color: Colors.yellow, note: 'E1'),
          buildKey(soundNumber: 4, color: Colors.green,  note: 'F1'),
          buildKey(soundNumber: 5, color: Colors.teal,   note: 'G1'),
          buildKey(soundNumber: 6, color: Colors.blue,   note: 'A1'),
          buildKey(soundNumber: 7, color: Colors.purple, note: 'B1'),
          buildKey(soundNumber: 8, color: Colors.pink, note: 'C2'),
        ],
      ),
    );
  }
}
