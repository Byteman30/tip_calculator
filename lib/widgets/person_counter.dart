import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required int personCount,
    required this.onIncreament,
    required this.onDecrement,
  }) : _personCount = personCount;

  final int _personCount;
  final VoidCallback onIncreament;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onDecrement, icon: const Icon(Icons.remove)),
        Text('$_personCount'),
        IconButton(onPressed: onIncreament, icon: const Icon(Icons.add)),
      ],
    );
  }
}
