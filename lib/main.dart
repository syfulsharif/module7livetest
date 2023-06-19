import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;
  int incrementNumber() {
    return count += 1;
  }
  int decrementNumber() {
    return count -= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body:  Center(
        child: Text('Press Count $count'),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            incrementNumber();
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
