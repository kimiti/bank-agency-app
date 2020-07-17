import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/components/background.dart';
import 'package:shop_app/src/constants/colors.dart';
import 'package:shop_app/src/constants/gradients.dart';
import 'package:shop_app/src/models/user.dart';
import 'package:shop_app/src/services/database.dart';

class BanksPage extends KFDrawerContent {
  @override
  _BanksPageState createState() => _BanksPageState();
}

class _BanksPageState extends State<BanksPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isSubmitting = false;

// banks total addition
  double coop = 0;
  double equity = 0;
  double kcb = 0;
  double family = 0;
  double lukele = 0;
  double airtelmoney = 0;
  double token = 0;
  double cash = 0;

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Background(
      child: SafeArea(
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
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        gradientTextComponent(BLUE_GRADIENT, "Banks"),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => coop = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Co-Op',
                                  prefixText: 'Co-Op:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => equity = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Equity',
                                  prefixText: 'Equity:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => kcb = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'KCB',
                                  prefixText: 'KCB:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => family = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Family',
                                  prefixText: 'Family:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Container(margin: EdgeInsets.only(top: 35)),
                        gradientTextComponent(BLUE_GRADIENT, "M-Pesa "),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => lukele = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Lukele',
                                  prefixText: 'Lukele:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) => setState(
                                    () => airtelmoney = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Airtel Money',
                                  prefixText: 'Airtel-Money:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => token = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Token',
                                  prefixText: 'Token:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (val) => val.isEmpty
                                    ? 'Please enter a number'
                                    : null,
                                onChanged: (val) =>
                                    setState(() => cash = double.parse(val)),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Cash',
                                  prefixText: 'Cash:     ',
                                  prefixStyle: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  hintText: 'Enter addition',
                                ))),
                        Container(margin: EdgeInsets.only(top: 35)),
                        submit(user),
                        Container(margin: EdgeInsets.only(top: 35)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget submit(user) {
    return _isSubmitting == true
        ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor))
        : GestureDetector(
            onTap: () async {
              setState(() => _isSubmitting = true);
              // print(
              //     "$equity$coop$equity$kcb$family$lukele$airtelmoney$token$cash");
              if (_formKey.currentState.validate()) {
                await DatabaseService().updatePostData(coop, equity, kcb,
                    family, lukele, airtelmoney, token, cash);
              }
              setState(() => _isSubmitting = false);
            },
            child: Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: BLUE_GRADIENT,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 24,
                    color: BLUE_SHADOW,
                    offset: Offset(0, 16),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  "UPLOAD",
                  style: TextStyle(
                    color: WHITE_COLOR,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          );
  }

  Widget gradientTextComponent(Gradient gradient, String text,
      {double size = 24,
      FontWeight weight = FontWeight.w300,
      TextAlign align = TextAlign.center}) {
    final rect = Rect.fromLTWH(0.0, 0.0, 200.0, 70.0);
    final Shader linearGradient = gradient.createShader(rect);

    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: size,
            fontWeight: weight,
            foreground: Paint()..shader = linearGradient),
      ),
    );
  }
}
