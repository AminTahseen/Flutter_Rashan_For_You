import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rashan_for_you/models/user.model.dart';
import 'package:rashan_for_you/screens/logged_out_screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key key}) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String username = 'Demo';
  String useremail = 'Demo email';

  Future getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userJSON = prefs.getString('userJSON');
    if (userJSON != null) {
      Map<String, dynamic> userMap =
          jsonDecode(userJSON) as Map<String, dynamic>;
      User user = User.fromJson(userMap);
      setState(() {
        useremail = user.user_email;
        username = user.user_name;
      });
    }
  }

  logoutUser() async {
    SmartDialog.showLoading();
    await Future.delayed(Duration(seconds: 2));
    SmartDialog.dismiss();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userJSON');
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Color generateRandomColor1() {
    // Define all colors you want here
    const predefinedColors = [Colors.white];
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }

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
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(
              useremail,
            ),
            accountName: Text(username, style: TextStyle(fontSize: 20)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: generateRandomColor1(),
              child: Text(
                getInitials(username),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            decoration: BoxDecoration(color: Colors.black87),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: const Text('My Profile'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: const Text('Personal Wallet'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.local_grocery_store),
            title: const Text('Grocery Lists'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => logoutUser(),
          ),
        ],
      ),
    );
  }
}
