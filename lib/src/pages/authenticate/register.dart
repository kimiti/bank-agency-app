import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/src/components/already_have_an_account_acheck.dart';
import 'package:shop_app/src/components/background.dart';
import 'package:shop_app/src/constants/colors.dart';
import 'package:shop_app/src/pages/authenticate/sign_in.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SIGNUP",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/business_shop.svg",
                    height: size.height * 0.35,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter a valid email',
                              icon: Icon(Icons.mail, color: Colors.grey)))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter password, min length 6',
                              icon: Icon(Icons.lock, color: Colors.grey)))),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    margin: EdgeInsets.only(left: 40.0),
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        color: kPrimaryColor,
                        onPressed: () {},
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
