import 'package:flutter/material.dart';

class MyPipes extends StatelessWidget {
  final size;
  MyPipes({this.size});

  @override
  Widget build(BuildContext context){
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.greenAccent,
      ),
    );
  }
}
