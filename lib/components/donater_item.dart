import 'package:flutter/material.dart';
import 'package:rashan_for_you/screens/Bottom_nav_screens/provider/make_donation_screen.dart';

class DonaterItem extends StatelessWidget {
  final String _userName;
  final String _userPno;
  const DonaterItem(this._userName, this._userPno);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ListTile(
        leading: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80'),
          ),
        ),
        title: Text(
          _userName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(_userPno),
        trailing: Container(
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: IconButton(
            icon: Icon(
              Icons.send_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StartDonationScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}
