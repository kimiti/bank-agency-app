import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:shop_app/src/pages/banks/banks.dart';
import 'package:shop_app/src/pages/dashboard/dashboad.dart';
import 'package:shop_app/src/services/auth.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  KFDrawerController _drawerController;
  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: DashBoard(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Dashboard', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: DashBoard(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Banks',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.calendar_today, color: Colors.white),
          page: BanksPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
//        menuPadding: EdgeInsets.all(0.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Container(),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN OUT',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            return AuthService().signOut();
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 1.0),
              Color.fromRGBO(44, 72, 171, 1.0)
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
