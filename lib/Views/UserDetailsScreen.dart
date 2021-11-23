import 'package:flutter/material.dart';
import 'app_text.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen();

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "My Details",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*.3,
              decoration: BoxDecoration(
                //color: Colors.grey
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Image.asset('assets/images/user_profile.png'),
                    radius: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,5,0,0),
                    child: AppText(text: 'User Name',),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex:1,
                          child: Icon(Icons.account_balance_wallet,
                            color: Colors.blue,size: 28,),
                        ),
                        Expanded(
                          flex: 4,
                          child: Text('Wallet Balance',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text('\৳12.96',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18
                            ),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                elevation: 10,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex:1,child: Icon(Icons.phone_android,
                              color: Colors.blue,size: 28,)),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mobile',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18
                                    ),),
                                  SizedBox(height: 5,),
                                  Text('012345678910'),
                                ],
                              ),
                            ),
                            Expanded(flex:1,child: IconButton(icon: Icon(Icons.edit,size: 28,), onPressed: (){})),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex:1,child: Icon(Icons.email,
                              color: Colors.blue,size: 28,)),
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18
                                    ),),
                                  SizedBox(height: 5,),
                                  Text('test@email.com'),
                                ],
                              ),
                            ),
                            Expanded(flex:1,child: IconButton(icon: Icon(Icons.edit,size: 28,), onPressed: (){})),
                          ],
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
    );
  }
}
