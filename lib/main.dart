import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Quotes(), title: "Flutter Quotes"));
}

class Quotes extends StatelessWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Quotes"),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("A placeholder quote", style: TextStyle(fontSize: 24.0)),
            Text("~ a placeholder author", style: TextStyle(fontSize: 18.0))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
