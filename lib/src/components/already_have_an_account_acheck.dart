import 'package:flutter/material.dart';
import 'package:shop_app/src/constants/colors.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            login ? "Don’t have an Account ? " : "Already have an Account ? ",
            style: TextStyle(color: kPrimaryColor),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              login ? "Sign Up" : "Sign In",
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
