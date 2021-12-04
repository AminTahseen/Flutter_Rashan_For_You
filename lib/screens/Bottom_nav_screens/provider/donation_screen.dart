import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rashan_for_you/components/donater_item.dart';

class MakeDonationScreen extends StatelessWidget {
  const MakeDonationScreen({Key key}) : super(key: key);

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
        title: Text('راشن | Donation'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: <Widget>[
                for (var i = 0; i < 6; i++)
                  DonaterItem('امین تحسین', '+92-33682734343'),
              ],
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 10.0,
            right: 10.0,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.only(
                  top: 30.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: 20.0,
                ),
                color: Colors.black,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  label: Text(
                    'نیا صارف اضافہ کریں',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
