import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Counter(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'State Management Counter - Muhammad Abduh',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class Counter with ChangeNotifier {
  int _counter = 0;

  get getCounter {
    return _counter;
  }

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProv = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Counter - Mabduh"),
      ),
      body: Center(
          child: Text(Provider.of<Counter>(context)._counter.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterProv.incrementCounter(); // untuk menambah + 1
          // counterProv.decrementCounter(); // untuk mengurang - 1
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
