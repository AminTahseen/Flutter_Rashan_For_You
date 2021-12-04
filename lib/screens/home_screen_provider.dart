import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rashan_for_you/components/drawer_menu.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/provider/home_main_screen.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/provider/donation_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _pageTitle = 'Home';
  static const List<String> _titleList = <String>[
    'Home',
    'Search',
    'Donation',
    'Rashan',
    'Profile'
  ];
  static const List<Widget> _widgetOptions = <Widget>[
    MainHomePage(),
    Center(
        child: Text('Search Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Donation Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Rashan Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    Center(
        child: Text('Profile Page',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MakeDonationScreen()),
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
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey.shade600,
        showSelectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle,
              color: Colors.green,
              size: 60,
            ),
            label: 'Donate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Rashan',
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
        elevation: 10,
      ),
    );
  }
}
