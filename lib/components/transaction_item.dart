import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  final String _title;
  final String _time;
  final String _amount;
  final Color _color;

  const TransactionItem(this._title, this._time, this._amount, this._color);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Icon(
          Icons.attach_money,
          size: 20,
          color: Colors.white,
        ),
      ),
      title: Text(
        this._title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(this._time),
      trailing: Text(
        this._amount,
        style: TextStyle(
          color: this._color,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
