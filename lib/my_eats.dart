import 'package:flutter/material.dart';

class MyEats extends StatelessWidget {
  final String title;

  MyEats(this.title);

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