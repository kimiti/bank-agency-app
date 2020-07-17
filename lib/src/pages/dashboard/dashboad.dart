import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/models/posts.dart';
import 'package:shop_app/src/pages/dashboard/dashboard_detail.dart';
import 'package:shop_app/src/services/database.dart';
import 'package:timeago/timeago.dart' as timeago;

var orange = Color(0xFFfc9f6a);
var pink = Color(0xFFee528c);
var blue = Color(0xFF8bccd6);
var darkBlue = Color(0xFF60a0d7);
var valueBlue = Color(0xFF5fa0d6);

class DashBoard extends KFDrawerContent {
  DashBoard({
    Key key,
  });
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
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
                          Icons.menu,
                          color: Colors.black,
                        ),
                        onPressed: widget.onMenuPressed,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Item(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: DatabaseService().brews,
      child: ItemList(),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Posts>>(context) ?? [];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: brews.length,
      itemBuilder: (context, index) {
        // return PostTile(brew: brews[index]);
        return Container(
          child: GestureDetector(
            onTap: () {
              // print("hello world");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardDetail(brew: brews[index]),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [blue, darkBlue]),
                        borderRadius: BorderRadius.circular(4.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            // Text(
                            //   "hello",
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 20.0),
                            // ),
                            date(brews[index].timestamp),
                            // Text(
                            //   "${brews[index].timestamp}",
                            //   style: TextStyle(color: Colors.white),
                            // )
                          ],
                        ),
                        Text(
                          "${brews[index].coop + brews[index].equity + brews[index].family + brews[index].kcb + brews[index].lukele + brews[index].airtelmoney + brews[index].token + brews[index].cash}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0),
                        )
                      ],
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}

date(timer) {
  Timestamp time = timer;
  final timeAgo = time.toDate();
  return Text(timeago.format(timeAgo));
}
