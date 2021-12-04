import 'package:flutter/material.dart';
import 'package:rashan_for_you/components/rashan_request_item.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10.0),
            child: Text(
              'Recent Requests',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Click on the requests to view details',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView(
                children: <Widget>[for (var i = 0; i < 6; i++) RashanRequest()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
