import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rashan_for_you/models/user.model.dart';
import 'package:rashan_for_you/screens/home_screen_provider.dart';
import 'package:rashan_for_you/screens/home_screen_requester.dart';
import 'package:rashan_for_you/screens/logged_out_screens/signup_screen.dart';
import 'package:rashan_for_you/services/LocalDb_services/userDBService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userEmailController = TextEditingController();
  final userPasswordController = TextEditingController();
  bool _validateEmail = false;
  bool _validatePass = false;

  void loginAccount() async {
    if (userEmailController.text != '' && userPasswordController.text != '') {
      User user = await UserDBService.getLogin(
          userEmailController.text, userPasswordController.text);
      if (user != null) {
        SmartDialog.showLoading();
        await Future.delayed(Duration(seconds: 2));
        SmartDialog.dismiss();
        Fluttertoast.showToast(
            msg: "Login Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
        setState(() {
          this._validateEmail = true;
          this._validatePass = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString("userJSON", jsonEncode(user));
//        Navigator.of(context).pop();
        setState(() {
          this._validateEmail = false;
          this._validatePass = false;
        });
        if (user.account_type == 'Provider') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreenRequester()),
          );
        }
      } else {
        SmartDialog.showLoading();
        await Future.delayed(Duration(seconds: 2));
        SmartDialog.dismiss();
        Fluttertoast.showToast(
            msg: "Invalid Credentials or Account Not Exists",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.black,
            fontSize: 16.0);
        setState(() {
          this._validateEmail = false;
          this._validatePass = false;
        });
      }
    } else {
      setState(() {
        this._validateEmail = true;
        this._validatePass = true;
      });
      Fluttertoast.showToast(
          msg: "1 or More Fields Are Not Filled Correctly",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          fontSize: 16.0);
    }
  }

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
        title: Text('راشن | Sign In'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Food_Bank_icon.svg/100px-Food_Bank_icon.svg.png'),
              ),
              Text(
                'راشن',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'For You',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 5.0,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      // errorText: 'Please provide a social email address !',
                      hintText: 'someone@domain.com',
                      errorText: _validateEmail
                          ? 'Email address is not correct'
                          : null,
                      labelText: 'Email Address'),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  controller: userPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      // errorText:
                      //     'At least 6 chars, caps and small along with special chars !',
                      hintText: 'Your password goes here',
                      errorText:
                          _validatePass ? 'Password is not correct' : null,
                      labelText: 'Password'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.red,
                    value: false,
                    onChanged: (bool value) {},
                  ),
                  Text(
                    'Show Password ',
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(
                    top: 30.0,
                    left: 30.0,
                    right: 30.0,
                    bottom: 10.0,
                  ),
                  color: Colors.black,
                  child: TextButton(
                    child: Text(
                      'سائن ان کریں',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => loginAccount(),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  'ایک نہیں ہے ؟ اب بنائیں',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
