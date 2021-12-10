import 'package:flutter/material.dart';

class RequestItem extends StatelessWidget {
  const RequestItem({Key key}) : super(key: key);
  String getInitials(String bankAccountName) => bankAccountName.isNotEmpty
      ? bankAccountName
          .trim()
          .split(RegExp(' +'))
          .map((s) => s[0])
          .take(2)
          .join()
      : '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Request Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Icon(
                Icons.health_and_safety_outlined,
                color: Colors.green,
                size: 30,
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Required For:'),
                  Text(
                    '2 Days',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Divider(),
            ListTile(
              title: Text('Requested User'),
              subtitle: Text('Date : 10/12/2021'),
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  getInitials('Requested User'),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
