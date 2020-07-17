import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/src/components/background.dart';
import 'package:shop_app/src/models/posts.dart';

var valueBlue = Color(0xFF5fa0d6);

class DashboardDetail extends StatelessWidget {
  final Posts brew;

  DashboardDetail({this.brew});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Background(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      child: Material(
                        shadowColor: Colors.transparent,
                        color: Colors.transparent,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Transactions',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.6),
                            fontSize: 18.0),
                      ),
                      date(brew.timestamp),
                      // Text(
                      //   'View all',
                      //   style: TextStyle(
                      //       color: Colors.blue, fontWeight: FontWeight.w500),
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16.0,
                        ),
                        ValueCard('Co-Op Bank', '${brew.coop}', Colors.green),
                        ValueCard(
                            'Equity Bank', '${brew.equity}', Colors.brown),
                        ValueCard('Family Bank', '${brew.family}', Colors.blue),
                        ValueCard(
                            'Lukele Bank', '${brew.lukele}', Colors.green),
                        ValueCard('Artelmoney Bank', '${brew.airtelmoney}',
                            Colors.green),
                        ValueCard('Token Bank', '${brew.token}', Colors.amber),
                        ValueCard('Cash Bank', '${brew.cash}', Colors.green),
                        ValueCard(
                            'TOTAL',
                            '${brew.coop + brew.equity + brew.family + brew.kcb + brew.lukele + brew.airtelmoney + brew.token + brew.cash}',
                            Colors.red),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }

  date(timer) {
    Timestamp time = timer;
    final timestamper = time.toDate();
    return Text("$timestamper");
  }
}

//  SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Text("${brew.kcb}"),
//           ],
//         ),
//       ),

class ValueCard extends StatelessWidget {
  final name;
  final value;
  final colors;

  ValueCard(
    this.name,
    this.value,
    this.colors,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: colors,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            SizedBox(
              height: 4.0,
            ),
            Divider()
          ],
        ));
  }
}
