import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rashan_for_you/components/calendar_item.dart';
import 'package:rashan_for_you/components/tab_item.dart';
import 'package:rashan_for_you/components/transaction_item.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'روزنامہ کیلنڈر',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Jan/2021',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  height: 100,
                  width: double.infinity,
                  child: ListView(
                    // This next line does the trick.
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CalendarItem('01', 'Mon'),
                      CalendarItem('02', 'Tue'),
                      CalendarItem('03', 'Wed'),
                      CalendarItem('04', 'Thr'),
                      CalendarItem('05', 'Fri'),
                      CalendarItem('06', 'Sat'),
                      CalendarItem('07', 'Sun')
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            margin: const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'موجودا بیلنس',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: CircularPercentIndicator(
                              radius: 120.0,
                              lineWidth: 10.0,
                              percent: 0.8,
                              center: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Balance',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'PKR 120,000',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  )
                                ],
                              ),
                              backgroundColor: Colors.black,
                              progressColor: Colors.green,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 150,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: ListView(
                              children: [
                                ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Icon(
                                      Icons.wallet_giftcard_rounded,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    'PKR 12,000',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.green),
                                  ),
                                  subtitle: Text(
                                    'کل بچت',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                ListTile(
                                  leading: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Icon(
                                      Icons.people,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  title: Text(
                                    '120 Peoples',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.green),
                                  ),
                                  subtitle: Text(
                                    'راشن فراہم کردہ',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 90,
                width: double.infinity,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    TabItem(
                      'History',
                      Icon(
                        Icons.history,
                        color: Colors.green,
                      ),
                    ),
                    TabItem(
                      'Events',
                      Icon(
                        Icons.event,
                        color: Colors.green,
                      ),
                    ),
                    TabItem(
                      'Savings',
                      Icon(
                        Icons.money,
                        color: Colors.green,
                      ),
                    ),
                    TabItem(
                      'Budget',
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              )),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            margin:
                const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20.0),
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'آج کے عطیات',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Scrollbar(
                        child: ListView(
                          children: <Widget>[
                            TransactionItem(
                              'Groceries Provided ',
                              'Jan 01, 12:00 pm',
                              '- PKR 200',
                              Colors.red,
                            ),
                            TransactionItem(
                              'Salary Income',
                              'Jan 02, 10:00 pm',
                              'PKR 40,000',
                              Colors.green,
                            ),
                            TransactionItem(
                              'Rent Provided',
                              'Jan 01, 11:00 am',
                              '- PKR 700',
                              Colors.red,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
