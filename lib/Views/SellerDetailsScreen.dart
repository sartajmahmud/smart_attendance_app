import 'package:flutter/material.dart';
import 'app_text.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen();

  @override
  _SellerDetailsScreenState createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
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
            text: "Seller Details",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/Banner_mobil.jpg',
                    scale: 1,
                    fit: BoxFit.fitWidth,
                  ),
                )),
            AppText(text:'ABC Company'),
            Column(
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex:1,child: Icon(Icons.date_range,
                        color: Colors.blue,size: 28,)),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date of Birth',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18
                              ),),
                            SizedBox(height: 5,),
                            Text('10/02/1990'),
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
                      Expanded(flex:1,child: Icon(Icons.location_on,
                        color: Colors.blue,size: 28,)),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Default Location',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18
                              ),),
                            SizedBox(height: 5,),
                            Text('Uttara, Dhaka'),
                          ],
                        ),
                      ),
                      Expanded(flex:1,child: IconButton(icon: Icon(Icons.edit,size: 28,), onPressed: (){})),
                    ],
                  ),
                ),
              ],
            ),
            AppText(text:'STOCK'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: Image.asset('assets/images/Bizol_G+.jpg')),
                        Expanded(
                          flex:4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bizol G+ 4L',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text('Price : 4800')
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Center(child: Text('193')),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 2,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,
                    child: Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: Image.asset('assets/images/Bizol_All_Rounder.jpg')),
                        Expanded(
                          flex:4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bizol All Rounder 4L',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  ),),
                                Text('Price : 4500')
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8),
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Center(child: Text('193')),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(thickness: 2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
