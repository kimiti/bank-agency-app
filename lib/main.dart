import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/pages/banks/banks.dart';
import 'package:shop_app/src/pages/dashboard/dashboad.dart';
import 'package:shop_app/src/services/auth.dart';
import 'package:shop_app/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter E-Commerce',
        routes: {
          '/dashboard': (BuildContext context) => DashBoard(),
          '/banks': (BuildContext context) => BanksPage(),
        },
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.cyan[400],
            accentColor: Colors.deepOrange[200],
            textTheme: TextTheme(
                headline5:
                    TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
                headline6:
                    TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
                bodyText2: TextStyle(fontSize: 18.0))),
        home: Wrapper(),
      ),
    );
  }
}
