import 'package:flutter/material.dart';

class ByDish extends StatelessWidget {
  final String title;

  ByDish(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(title),
      ),
    );
  }
}