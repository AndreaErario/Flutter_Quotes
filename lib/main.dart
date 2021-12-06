import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Quotes(), title: "Flutter Quotes"));
}

class Quotes extends StatelessWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
