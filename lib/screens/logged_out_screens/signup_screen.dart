import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:rashan_for_you/models/user.model.dart';
import 'package:rashan_for_you/services/LocalDb_services/userDBService.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userAccountTypeController = TextEditingController();
  final userPasswordController = TextEditingController();

  void createAccount() async {
    print('Create Account');
    if (userNameController.text != '' &&
        userEmailController.text != '' &&
        userAccountTypeController.text != '' &&
        userPasswordController.text != '') {
      final user = User(
        user_name: userNameController.text,
        user_password: userPasswordController.text,
        user_email: userEmailController.text,
        account_type: userAccountTypeController.text,
      );
      SmartDialog.showLoading();
      await Future.delayed(Duration(seconds: 2));
      SmartDialog.dismiss();
      await UserDBService.createNewUser(user);
    } else {
      print('Null');
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
        title: Text('راشن | Sign Up'),
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
                  controller: userNameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'John Doe',
                      labelText: 'Provide Your Full Name'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: TextFormField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'someone@domain.com',
                      labelText: 'Provide Your Email Address'),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  readOnly: true,
                  controller: userAccountTypeController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Your Account Type',
                    labelText: 'Select Account Type',
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
                child: TextFormField(
                  controller: userPasswordController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'your password goes here',
                      labelText: 'Provide Your Password'),
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
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => createAccount(),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Text(
                  'Already Have One ? Sign In',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
