import 'dart:ui';

import 'package:flutter/material.dart';

class CalendarItem extends StatelessWidget {
  final String _dateNumber;
  final String _dateText;

  CalendarItem(this._dateNumber, this._dateText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Show for $_dateNumber $_dateText');
      },
      child: Card(
        child: Container(
          width: 80,
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _dateText.toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 5.0,
                    fontSize: 12),
              ),
              Text(
                _dateNumber,
                style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              )
            ],
          ),
        ),
      ),
    );
  }
}
