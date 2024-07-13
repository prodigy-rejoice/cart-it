import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
  });
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 1;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 50,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: IconButton(
              icon: const Icon(Icons.remove, color: Color(0xff408C2B)),
              onPressed: _decrementCount,
            ),
          ),
          Container(
            height: 40,
            width: 50,
            decoration: const BoxDecoration(
              border:
                  Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
            ),
            child: Center(
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Color(0xff408C2B)),
              onPressed: _incrementCount,
            ),
          ),
        ],
      ),
    );
  }
}
