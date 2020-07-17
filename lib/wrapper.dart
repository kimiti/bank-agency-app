import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/models/user.dart';
import 'package:shop_app/src/pages/authenticate/sign_in.dart';
import 'package:shop_app/src/pages/home/home_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}
