import 'dart:async';
import 'package:flappybirdie/bird.dart';
import 'package:flappybirdie/pipes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double intHeight = birdYaxis;
  bool gameStart = false;
  static double pipeXone = 1;
  double pipeXtwo = pipeXone + 1.5;

  void jump() {
    setState(() {
      time = 0;
      intHeight = birdYaxis;
    });
  }

  void startGame() {
    gameStart = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = intHeight - height;
      });
      setState(() {
        if (pipeXone < -2) {
          pipeXone += 3.5;
        } else {
          pipeXone -= 0.05;
        }
      });
      setState(() {
        if (pipeXtwo < -2) {
          pipeXtwo += 3.5;
        } else {
          pipeXtwo -= 0.05;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        gameStart = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (gameStart) {
            jump();
          } else {
            startGame();
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      alignment: Alignment(0, birdYaxis),
                      duration: Duration(milliseconds: 0),
                      color: Colors.blue,
                      child: MyBird(),
                    ),
                    Container(
                      alignment: Alignment(0, -0.2),
                      child: gameStart
                          ? Text(" ")
                          : Text("T A P  T O  P L A Y",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(pipeXone, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyPipes(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(pipeXone, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyPipes(
                        size: 200.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(pipeXtwo, 1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyPipes(
                        size: 150.0,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(pipeXtwo, -1.1),
                      duration: Duration(milliseconds: 0),
                      child: MyPipes(
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
                          Text("Score:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("0",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Best:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("10",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 35)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
