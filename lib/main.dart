// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final player = AudioPlayer();

  Future<void> playSound(int soundNumber) async {
    await player.play(
      AssetSource("note$soundNumber.wav"),
      mode: PlayerMode.lowLatency,
    );
  }

  Widget buildKey(
      {required double height,
      required int soundNumber,
      required Color color}) {
    return Expanded(
      child: Container(
        color: color,
        width: double.infinity,
        child: GestureDetector(
          onTap: () => playSound(soundNumber),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                height: size.height,
                soundNumber: 1,
                color: Colors.red,
              ),
              buildKey(
                height: size.height,
                soundNumber: 2,
                color: Colors.orange,
              ),
              buildKey(
                height: size.height,
                soundNumber: 3,
                color: Colors.yellow,
              ),
              buildKey(
                height: size.height,
                soundNumber: 4,
                color: Colors.green,
              ),
              buildKey(
                height: size.height,
                soundNumber: 5,
                color: Colors.teal,
              ),
              buildKey(
                height: size.height,
                soundNumber: 6,
                color: Colors.blue,
              ),
              buildKey(
                height: size.height,
                soundNumber: 7,
                color: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
