import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Contants.dart';
import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends StateMVC<SignUpWidget> {
  UserController _con;

  _SignUpWidgetState() : super(UserController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _con.scaffoldKey,
        resizeToAvoidBottomPadding: false,
        body: Stack(
          //alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/img/log in bg.jpg",
                        ), fit: BoxFit.cover)
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 110.0),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text("  Welcome to",
                    style: TextStyle(fontFamily: "Comfortaa",
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text("  food-aholic",
                      style: TextStyle(fontFamily: "Comfortaa",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                        height: 50,
                        width: 50,
                        child: Image.asset("assets/img/logo.png"))
                  ],
                ),
                SizedBox(height: 80),
                Form(
                  key: _con.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Comfortaa',
                            ),
                            keyboardType: TextInputType.text,
                            onSaved: (input) => _con.user.name = input,
                            validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_letters : null,
                            decoration: InputDecoration(
                              //labelText: S.of(context).full_name,
                              //labelStyle: TextStyle(color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.only(top: 14.0),
                              hintText: "Full name",
                              hintStyle: kHintTextStyle,
                              prefixIcon: Icon(Icons.person_outline, color: Colors.white),
                              border: InputBorder.none,
                              //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                              //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (input) => _con.user.email = input,
                            validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                            decoration: InputDecoration(
                              //labelText: S.of(context).email,
                              //labelStyle: TextStyle(color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.all(12),
                              hintText: 'johndoe@gmail.com',
                              hintStyle: kHintTextStyle,
                              prefixIcon: Icon(Icons.email_outlined, color: Colors.white),
                              border: InputBorder.none,
                              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                              // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60.0,
                          child: TextFormField(
                            obscureText: _con.hidePassword,
                            onSaved: (input) => _con.user.password = input,
                            validator: (input) => input.length < 6 ? S.of(context).should_be_more_than_6_letters : null,
                            decoration: InputDecoration(
                              //labelText: S.of(context).password,
                              //labelStyle: TextStyle(color: Theme.of(context).accentColor),
                              contentPadding: EdgeInsets.only(top: 14.0),
                              hintText: '••••••••••••',
                              hintStyle: kHintTextStyle,
                              prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _con.hidePassword = !_con.hidePassword;
                                  });
                                },
                                color: Colors.white,
                                icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
                              ),
                              border: InputBorder.none,
                              // focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                              // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 60,right: 60),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 25.0),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5.0,
                            onPressed: () => _con.register(),
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            color: Colors.white,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: Color(0xFFbf1e2e),
                                letterSpacing: 1.5,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Comfortaa',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed('/Login'),
                          //padding: EdgeInsets.only(right: 0.0),
                          child: Text(
                            'I have account? Back to login',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 15,
                                fontFamily: "Comfortaa",
                                color: Colors.white,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                        ),
                      ),
//                      FlatButton(
//                        onPressed: () {
//                          Navigator.of(context).pushNamed('/MobileVerification');
//                        },
//                        padding: EdgeInsets.symmetric(vertical: 14),
//                        color: Theme.of(context).accentColor.withOpacity(0.1),
//                        shape: StadiumBorder(),
//                        child: Text(
//                          'Register with Google',
//                          textAlign: TextAlign.start,
//                          style: TextStyle(
//                            color: Theme.of(context).accentColor,
//                          ),
//                        ),
//                      ),
                    ],
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
