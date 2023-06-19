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
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
            child: AlertDialog(
              title: const Text('Counter Alert!'),
              content: const Text('Counter Value is 5!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Ok'),
                ),
              ],
            ),
          );
        });
  }

  int count = 0;
  int increment() => count += 1;
  int decrement() => count -= 1;
  void logicBox() {
    if (count == 5) {
      MyAlertDialog(context);
    }
    if (count == 10) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            alignment: Alignment.center,
            child: const Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            count.toString(),
            style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Expanded(
              flex: 3,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        increment();
                        logicBox();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 2.0)),
                    child: const Icon(Icons.add)),
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      decrement();
                      logicBox();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: const Center(
          child: Text(
        'Congratulations! You reached 10!',
        style: TextStyle(fontSize: 25.0),
      )),
    );
  }
}
