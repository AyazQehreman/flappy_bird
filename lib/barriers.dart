import 'package:flutter/material.dart';

class Barrier extends StatelessWidget
{
  final size;

  Barrier({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(width: 4.0, color: Colors.brown),
        borderRadius: BorderRadius.circular(15.0),
      ),
    );
  }
}
