import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MakeRequest extends StatefulWidget {
  const MakeRequest({Key key}) : super(key: key);

  @override
  _MakeRequestState createState() => _MakeRequestState();
}

class _MakeRequestState extends State<MakeRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade900,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('راشن | Make Request'),
      ),
      body: Center(
        child: Text('Make Request'),
      ),
    );
  }
}
