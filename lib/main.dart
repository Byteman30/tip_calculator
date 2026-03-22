import 'package:flutter/material.dart';
import 'package:tip_calculator/widgets/person_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Utip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Utip(),
    );
  }
}

class Utip extends StatefulWidget {
  const Utip({super.key});

  @override
  State<Utip> createState() => _UtipState();
}

class _UtipState extends State<Utip> {
  int _personCount = 1;

  void increament() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount = _personCount - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Utip App')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('Total per person', style: TextStyle(fontSize: 24)),
                  Text(
                    '\$20.67',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: 100,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Color.fromARGB(255, 175, 130, 231)),
                //creating a container for our text field
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      labelText: 'Bill Amount',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      // Handle text field changes
                      print('value: $value');
                    },
                  ),

                  // addding the split bill
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      PersonCounter(
                        personCount: _personCount,
                        onIncreament: increament,
                        onDecrement: decrement,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
