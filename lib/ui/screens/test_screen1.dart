import 'package:flutter/material.dart';

class TestScreen1 extends StatefulWidget {
  const TestScreen1({super.key});

  @override
  State<TestScreen1> createState() => _TestScreen1State();
}

class _TestScreen1State extends State<TestScreen1> {
  @override
  Widget build(BuildContext context) {
    print("object");

    return const Scaffold(
      body: Center(
        child: Text(
          "Test Screen",
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
