import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Number Shapes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nrController = TextEditingController();

  Future<void> _square(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(' ${nrController.text} is a square number'),
        );
      },
    );
  }

  Future<void> _cube(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(' ${nrController.text} is a cube number'),
        );
      },
    );
  }

  Future<void> _squareandcube(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(' ${nrController.text} is a square and a cube number'),
        );
      },
    );
  }

  Future<void> _none(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(' ${nrController.text} is not a square and not a cube number'),
        );
      },
    );
  }

  bool isSquare(int nr) {
    for (int i = 1; i <= nr; i++) {
      if (i * i == nr) {
        return true;
      }
    }
    return false;
  }

  bool isCube(int nr) {
    for (int i = 1; i <= nr; i++) {
      if (i * i * i == nr) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Please input a number to see if it is a square or a cube',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: nrController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a number',
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final int nr = int.parse(nrController.text);
          if (isSquare(nr) && isCube(nr)) {
            _squareandcube(context);
          } else if (isSquare(nr)) {
            _square(context);
          } else if (isCube(nr)) {
            _cube(context);
          } else {
            _none(context);
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
