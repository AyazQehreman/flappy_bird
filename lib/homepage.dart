import 'dart:async';

import 'package:flappy_bird/barriers.dart';
import 'package:flappy_bird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYAxis = 0.0;
  double time = 0.0;
  double height = 0.0;
  double initialHeight = birdYAxis;
  bool gameHasStarted = false;
  static double barrierXOne = 2.0;
  double barrierXTwo = barrierXOne + 1.5;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYAxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYAxis = initialHeight - height;
        barrierXOne -= 0.05;
        barrierXTwo -= 0.05;
      });

      setState(() {
        barrierOneCreator();
        barrierTwoCreator();
      });


      if (birdYAxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  void barrierOneCreator() {
    if(barrierXOne < -1.1)
      {
        barrierXOne += 2.3;
      }
  }
  void barrierTwoCreator() {
    if(barrierXTwo < -1.1)
    {
      barrierXTwo+= 2.3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (gameHasStarted) {
          jump();
        } else
          startGame();
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYAxis),
                      duration: Duration(microseconds: 0),
                      child: Bird(),
                      color: Colors.blue,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXOne, 1.1),
                      child: Barrier(size: 100.0),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXOne, -1.1),
                      child: Barrier(size: 250.0),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXTwo, 1.1),
                      child: Barrier(size: 150.0),
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 0),
                      alignment: Alignment(barrierXTwo, -1.0),
                      child: Barrier(size: 200.0),
                    ),
                    Container(
                      alignment: Alignment(0, -0.5),
                      child: Text(
                        'T A P  T O  P L A Y',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color:
                          gameHasStarted ? Colors.transparent : Colors.white,
                        ),
                      ),
                    ),

                  ],
                )),
            Container(
              height: 15.0,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown[500],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'SCORE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BEST',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '0',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
