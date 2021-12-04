import 'dart:ffi';

import 'package:flutter/material.dart';

class RashanRequest extends StatelessWidget {
  const RashanRequest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: MediaQuery.of(context).size.width,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  child: Image.network(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
                ),
              ),
              title: Text(
                'Requester Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              subtitle: Text('Occupation'),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'Rashan Requirements details goes here. Lorem Ipsum is simply dummy text of the printing and typesetting industry.'),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('To be Provided : 3 Days'),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      margin: const EdgeInsets.all(10.0),
                      child: TextButton(
                        child: Text(
                          'Decline',
                          style: TextStyle(color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      margin: const EdgeInsets.all(10.0),
                      child: TextButton(
                        child: Text(
                          'Send Request',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
