import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(const MaterialApp(home: Quotes(), title: "Flutter Quotes"));
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  String text = "";
  String author = "";

  void getQuote() async {
    Response quote = await get(Uri.parse("https://api.quotable.io/random"));
    Map json = jsonDecode(quote.body);
    setState(() {
      text = json["content"];
      author = json["author"];
    });
  }

  @override
  void initState() {
    getQuote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Flutter Quotes"),
        backgroundColor: Colors.teal[300],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                (() {
                  if (text != "") {
                    return text;
                  }
                  return "Loading quote...";
                }()),
                style: const TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center),
            const Divider(height: 30, indent: 20, endIndent: 20),
            Text("~ $author",
                style: const TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getQuote();
        },
        child: const Icon(Icons.refresh),
        backgroundColor: Colors.teal[300],
      ),
    );
  }
}
