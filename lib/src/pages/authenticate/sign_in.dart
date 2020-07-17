import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/src/components/already_have_an_account_acheck.dart';
import 'package:shop_app/src/components/background.dart';
import 'package:shop_app/src/constants/colors.dart';
import 'package:shop_app/src/pages/authenticate/register.dart';
import 'package:shop_app/src/services/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height * 0.03),
                  SvgPicture.asset(
                    "assets/icons/login.svg",
                    height: size.height * 0.35,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                          validator: (val) =>
                              !val.contains('@') ? 'Invalid Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              hintText: 'Enter a valid email',
                              icon: Icon(Icons.mail, color: Colors.grey)))),
                  Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
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
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Register();
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
