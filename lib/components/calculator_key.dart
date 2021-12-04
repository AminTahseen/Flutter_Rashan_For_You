import 'package:flutter/material.dart';

class CalculatorKey extends StatelessWidget {
  final String _tabText;

  const CalculatorKey(this._tabText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width * 0.30,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey.shade400, // background
            onPrimary: Colors.black, // foreground
          ),
          child: Text(
            _tabText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
