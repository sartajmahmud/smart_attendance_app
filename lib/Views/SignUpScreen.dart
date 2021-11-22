import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Controllers/UserController.dart';
import 'ForgetPasswordOTPScreen.dart';
import 'SignUpOTPScreen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends StateMVC<SignUpScreen> {
  UserController _con;
  final myController = TextEditingController();
  _SignUpScreenState() : super(UserController()) {
    _con = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                // ignore: prefer_const_literals_to_create_immutables
                stops: [0.0, 1],
                colors: [Colors.grey.shade700, Colors.grey.shade100],
              )),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Image.asset(
                      'assets/images/bizol_logo.png',
                      scale: 5,
                    ),
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (input) => _con.user.name = input,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: 'Name',
                                prefixIcon: Icon(Icons.person,
                                    color: Color(0xFFbf1e2e)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (input) => _con.user.email = input,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: 'Email',
                                prefixIcon:
                                Icon(Icons.email, color: Color(0xFFbf1e2e)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextFormField(
                              controller: myController,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.phone,
                              //onChanged: (input) => _con.user.phone = input,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: '01XXXXXXXXX',
                                prefixIcon:
                                Icon(Icons.phone, color: Color(0xFFbf1e2e)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                            height: 60.0,
                            child: TextFormField(
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (input) => _con.user.password = input,
                              obscureText: true,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: 'Password',
                                prefixIcon: Icon(Icons.lock_outline,
                                    color: Color(0xFFbf1e2e)),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 100, right: 100),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 5.0,
                              onPressed: () async {
                                print('${_con.user.name}');
                                print('${_con.user.email}');
                                print('${_con.user.password}');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUpOTPScreen(
                                                myController.text
                                                    .toString(),
                                                _con)));
                                //await _con.register();
                              },
                              padding: const EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFFbf1e2e),
                                  letterSpacing: 1.5,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen())),
                            child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Back to Login',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ]),
        ),
      ),
    );
  }
}
