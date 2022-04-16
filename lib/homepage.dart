import 'dart:async';

import 'package:flappy_bird_clone/barriers.dart';
import 'package:flappy_bird_clone/bird.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int score = 0;
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  double barrierXone = 1.1;
  double barrierXtwo = 1.1 + 1.7;

  bool gameHasStarted = false;

  void restartGame() {
    setState(() {
      time = 0;
      height = 0;
      birdYaxis = 0;
      initialHeight = birdYaxis;
      gameHasStarted = false;
      barrierXone = 1.1;
      barrierXtwo = barrierXone + 1.7;
      score = 0;
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(
      const Duration(milliseconds: 45),
      (timer) {
        time += 0.04;
        height = -4.9 * time * time + 3.5 * time;
        birdYaxis = initialHeight - height;

        setState(() {
          if (barrierXone == 0.0) {
            score++;
          }
          if (barrierXtwo == 0.0) {
            score++;
          }
        });
        setState(() {
          if (barrierXone < -2) {
            barrierXone += 3.5;
          } else {
            barrierXone -= 0.05;
          }
        });

        setState(() {
          if (barrierXtwo < -2) {
            barrierXtwo += 3.5;
          } else {
            barrierXtwo -= 0.05;
          }
        });
        //when bird touches ground
        if (birdYaxis > 1) {
          timer.cancel();
          gameHasStarted = false;
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('GAME OVER'),
              content: const Text('Want to Restart?'),
              actions: [
                TextButton(
                    onPressed: () {
                      SystemNavigator.pop();
                    },
                    child: const Text('Exit')),
                TextButton(
                    onPressed: () {
                      restartGame();
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Restart')),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                AnimatedContainer(
                  alignment: Alignment(0, birdYaxis),
                  duration: const Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: const MyBird(),
                ),
                Container(
                  alignment: const Alignment(0, -0.3),
                  child: gameHasStarted
                      ? const Text('')
                      : const Text(
                          'TAP TO PLAY',
                          style: TextStyle(fontSize: 20),
                        ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  alignment: Alignment(barrierXone, 1.1),
                  child: const Barrier(
                    size: 200.0,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  alignment: Alignment(barrierXone, -1.4),
                  child: const Barrier(
                    size: 200.0,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  alignment: Alignment(barrierXtwo, 1.1),
                  child: const Barrier(
                    size: 150.0,
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  alignment: Alignment(barrierXtwo, -1.1),
                  child: const Barrier(
                    size: 250.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 15,
            color: Colors.green,
          ),
          Expanded(
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "SCORE",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "$score",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "BEST",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "10",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
