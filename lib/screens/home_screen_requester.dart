import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rashan_for_you/components/drawer_menu.dart';
import 'package:rashan_for_you/models/user.model.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/provider/donation_screen.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/requester/home_requests_screen.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/requester/make_request_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenRequester extends StatefulWidget {
  const HomeScreenRequester({Key key}) : super(key: key);

  @override
  _HomeScreenRequesterState createState() => _HomeScreenRequesterState();
}

class _HomeScreenRequesterState extends State<HomeScreenRequester> {
  int _selectedIndex = 0;
  String _pageTitle = 'Home';
  String userType = 'Demo';

  static const List<String> _titleList = <String>[
    'Home',
    'Messages',
    'Donation',
    'Offers',
    'Profile'
  ];
  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJSON = prefs.getString('userJSON');
    if (userJSON != null) {
      Map<String, dynamic> userMap =
          jsonDecode(userJSON) as Map<String, dynamic>;
      User user = User.fromJson(userMap);
      setState(() {
        userType = user.account_type;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeRequest(),
    Center(
        child: Text('Messages Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Donation Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Offers Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Profile Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
  ];
  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MakeRequest()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
        _pageTitle = _titleList[_selectedIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade900,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Text('راشن | $_pageTitle'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 50,
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_sharp),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.health_and_safety_outlined,
              color: Colors.green,
              size: 50,
            ),
            label: 'Request',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
