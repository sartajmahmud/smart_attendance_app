import 'package:foodaholic_rider_app/src/helpers/helper.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../Contants.dart';
import '../../generated/l10n.dart';
import '../controllers/user_controller.dart';
import '../elements/BlockButtonWidget.dart';
import '../helpers/app_config.dart' as config;
import '../repository/user_repository.dart' as userRepo;

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends StateMVC<LoginWidget> {
  UserController _con;

  _LoginWidgetState() : super(UserController()) {
    _con = controller;
  }

  @override
  void initState() {
    super.initState();
    if (userRepo.currentUser.value?.apiToken != null) {
      Navigator.of(context).pushReplacementNamed('/Pages', arguments: 1);
    }
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: Helper.of(context).onWillPop,
      child: Scaffold(
        key: _con.scaffoldKey,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/img/log in bg.jpg",
                    ), fit: BoxFit.fill)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Container()),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
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
                              height: 30,
                              width: 50,
                              child: Image.asset("assets/img/logo.png"))
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Form(
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
                              keyboardType: TextInputType.phone,
                              onSaved: (input) => _con.user.mobile = input,
                              //validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
                              decoration: InputDecoration(
                                //labelText: S.of(context).email,
                                //labelStyle: TextStyle(color: Theme.of(context).accentColor),
                                contentPadding: EdgeInsets.only(top: 14.0),
                                hintText: '01710000000',
                                hintStyle: kHintTextStyle,
                                prefixIcon: Icon(Icons.phone, color: Colors.white),
                                border: InputBorder.none,
                                //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                                //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
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
                              onSaved: (input) => _con.user.password = input,
                              validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
                              obscureText: _con.hidePassword,
                              decoration: InputDecoration(
                                // labelText: S.of(context).password,
                                //  labelStyle: TextStyle(color: Theme.of(context).accentColor),
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
                                //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
                                //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 60,right: 60),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            width: double.infinity,
                            child: RaisedButton(
                              elevation: 5.0,
                              onPressed: () => _con.login(),
                              padding: EdgeInsets.all(15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              color: Colors.white,
                              child: Text(
                                'LOGIN',
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
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacementNamed('/ForgetPassword'),
                            //padding: EdgeInsets.only(right: 0.0),
                            child: Text(
                              'Forgot Password?',
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
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacementNamed('/SignUp'),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an Account? ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Comfortaa",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold

                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        fontSize: 15,
                                        fontFamily: "Comfortaa",
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold

                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container()),
              ],
            ),
          ),
        ),
      ),
    );

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         key: _con.scaffoldKey,
//         resizeToAvoidBottomPadding: false,
//         body: Stack(
//           // alignment: AlignmentDirectional.topCenter,
//           children: <Widget>[
//             Container(
//               alignment: Alignment.center,
//               child: Container(
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage(
//                           "assets/img/log in bg.jpg",
//                         ), fit: BoxFit.cover)
//                 ),
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(height: 150.0),
//                 Container(
//                   alignment: Alignment.topLeft,
//                   child: Text("  Welcome to",
//                     style: TextStyle(fontFamily: "Comfortaa",
//                         fontWeight: FontWeight.bold,
//                         fontSize: 30,
//                         color: Colors.white
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Text("  food-aholic",
//                       style: TextStyle(fontFamily: "Comfortaa",
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white
//                       ),
//                     ),
//                     SizedBox(width: 10),
//                     Container(
//                         height: 50,
//                         width: 50,
//                         child: Image.asset("assets/img/logo.png"))
//                   ],
//                 ),
//                 SizedBox(height: 100),
//                 Form(
//                   key: _con.loginFormKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(left: 60,right: 60),
//                         child: Container(
//                           alignment: Alignment.centerLeft,
//                           decoration: kBoxDecorationStyle,
//                           height: 60.0,
//                           child: TextFormField(
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Comfortaa',
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                             onSaved: (input) => _con.user.mobile = input,
//                             //validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
//                             decoration: InputDecoration(
//                               //labelText: S.of(context).email,
//                               //labelStyle: TextStyle(color: Theme.of(context).accentColor),
//                               contentPadding: EdgeInsets.only(top: 14.0),
//                               hintText: 'johndoe@gmail.com',
//                               hintStyle: kHintTextStyle,
//                               prefixIcon: Icon(Icons.email, color: Colors.white),
//                               border: InputBorder.none,
//                               //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
//                               //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 30),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 60,right: 60),
//                         child: Container(
//                           alignment: Alignment.centerLeft,
//                           decoration: kBoxDecorationStyle,
//                           height: 60.0,
//                           child: TextFormField(
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontFamily: 'Comfortaa',
//                             ),
//                             keyboardType: TextInputType.text,
//                             onSaved: (input) => _con.user.password = input,
//                             validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
//                             obscureText: _con.hidePassword,
//                             decoration: InputDecoration(
//                               // labelText: S.of(context).password,
//                               //  labelStyle: TextStyle(color: Theme.of(context).accentColor),
//                               contentPadding: EdgeInsets.only(top: 14.0),
//                               hintText: '••••••••••••',
//                               hintStyle: kHintTextStyle,
//                               prefixIcon: Icon(Icons.lock_outline, color: Colors.white),
//                               suffixIcon: IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _con.hidePassword = !_con.hidePassword;
//                                   });
//                                 },
//                                 color: Colors.white,
//                                 icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
//                               ),
//                               border: InputBorder.none,
//                               //focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
//                               //enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 60,right: 60),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(vertical: 25.0),
//                           width: double.infinity,
//                           child: RaisedButton(
//                             elevation: 5.0,
//                             onPressed: () => _con.login(),
//                             padding: EdgeInsets.all(15.0),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30.0),
//                             ),
//                             color: Colors.white,
//                             child: Text(
//                               'LOGIN',
//                               style: TextStyle(
//                                 color: Color(0xFFbf1e2e),
//                                 letterSpacing: 1.5,
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Comfortaa',
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Container(
//                         alignment: Alignment.center,
//                         child: GestureDetector(
//                           onTap: () => Navigator.of(context).pushReplacementNamed('/ForgetPassword'),
//                           //padding: EdgeInsets.only(right: 0.0),
//                           child: Text(
//                             'Forgot Password?',
//                             style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 15,
//                                 fontFamily: "Comfortaa",
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold
//
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Container(
//                         alignment: Alignment.center,
//                         child: GestureDetector(
//                           onTap: () => Navigator.of(context).pushReplacementNamed('/SignUp'),
//                           child: RichText(
//                             text: TextSpan(
//                               children: [
//                                 TextSpan(
//                                   text: 'Don\'t have an Account? ',
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontFamily: "Comfortaa",
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold
//
//                                   ),
//                                 ),
//                                 TextSpan(
//                                   text: 'Sign Up',
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       fontSize: 15,
//                                       fontFamily: "Comfortaa",
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold
//
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
// //             Positioned(
// //               top: config.App(context).appHeight(37) - 50,
// //               child: Container(
// //                 decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.all(Radius.circular(10)), boxShadow: [
// //                   BoxShadow(
// //                     blurRadius: 50,
// //                     color: Theme.of(context).hintColor.withOpacity(0.2),
// //                   )
// //                 ]),
// //                 margin: EdgeInsets.symmetric(
// //                   horizontal: 20,
// //                 ),
// //                 padding: EdgeInsets.only(top: 50, right: 27, left: 27, bottom: 20),
// //                 width: config.App(context).appWidth(88),
// // //              height: config.App(context).appHeight(55),
// //                 child: Form(
// //                   key: _con.loginFormKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       TextFormField(
// //                         keyboardType: TextInputType.emailAddress,
// //                         onSaved: (input) => _con.user.email = input,
// //                         validator: (input) => !input.contains('@') ? S.of(context).should_be_a_valid_email : null,
// //                         decoration: InputDecoration(
// //                           labelText: S.of(context).email,
// //                           labelStyle: TextStyle(color: Theme.of(context).accentColor),
// //                           contentPadding: EdgeInsets.all(12),
// //                           hintText: 'johndoe@gmail.com',
// //                           hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
// //                           prefixIcon: Icon(Icons.alternate_email, color: Theme.of(context).accentColor),
// //                           border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
// //                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
// //                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
// //                         ),
// //                       ),
// //                       SizedBox(height: 30),
// //                       TextFormField(
// //                         keyboardType: TextInputType.text,
// //                         onSaved: (input) => _con.user.password = input,
// //                         validator: (input) => input.length < 3 ? S.of(context).should_be_more_than_3_characters : null,
// //                         obscureText: _con.hidePassword,
// //                         decoration: InputDecoration(
// //                           labelText: S.of(context).password,
// //                           labelStyle: TextStyle(color: Theme.of(context).accentColor),
// //                           contentPadding: EdgeInsets.all(12),
// //                           hintText: '••••••••••••',
// //                           hintStyle: TextStyle(color: Theme.of(context).focusColor.withOpacity(0.7)),
// //                           prefixIcon: Icon(Icons.lock_outline, color: Theme.of(context).accentColor),
// //                           suffixIcon: IconButton(
// //                             onPressed: () {
// //                               setState(() {
// //                                 _con.hidePassword = !_con.hidePassword;
// //                               });
// //                             },
// //                             color: Theme.of(context).focusColor,
// //                             icon: Icon(_con.hidePassword ? Icons.visibility : Icons.visibility_off),
// //                           ),
// //                           border: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
// //                           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.5))),
// //                           enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Theme.of(context).focusColor.withOpacity(0.2))),
// //                         ),
// //                       ),
// //                       SizedBox(height: 30),
// //                       BlockButtonWidget(
// //                         text: Text(
// //                           S.of(context).login,
// //                           style: TextStyle(color: Theme.of(context).primaryColor),
// //                         ),
// //                         color: Theme.of(context).accentColor,
// //                         onPressed: () {
// //                           _con.login();
// //                         },
// //                       ),
// //                       SizedBox(height: 15),
// //                       FlatButton(
// //                         onPressed: () {
// //                           Navigator.of(context).pushReplacementNamed('/Pages', arguments: 2);
// //                         },
// //                         shape: StadiumBorder(),
// //                         textColor: Theme.of(context).hintColor,
// //                         child: Text(S.of(context).skip),
// //                         padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
// //                       ),
// // //                      SizedBox(height: 10),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Positioned(
// //               bottom: 10,
// //               child: Column(
// //                 children: <Widget>[
// //                   FlatButton(
// //                     onPressed: () {
// //                       Navigator.of(context).pushReplacementNamed('/ForgetPassword');
// //                     },
// //                     textColor: Theme.of(context).hintColor,
// //                     child: Text(S.of(context).i_forgot_password),
// //                   ),
// //                   FlatButton(
// //                     onPressed: () {
// //                       Navigator.of(context).pushReplacementNamed('/SignUp');
// //                     },
// //                     textColor: Theme.of(context).hintColor,
// //                     child: Text(S.of(context).i_dont_have_an_account),
// //                   ),
// //                 ],
// //               ),
// //             )
//           ],
//         ),
//       ),
//     );
  }
}
