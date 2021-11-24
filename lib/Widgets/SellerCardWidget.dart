import 'package:flutter/material.dart';
import '../Views/app_text.dart';

class SellerCardWidget extends StatefulWidget {
  String imagepath, name, location;
  bool selected;

  SellerCardWidget(this.name, this.imagepath, this.location, this.selected);

  @override
  _SellerCardWidgetState createState() => _SellerCardWidgetState();
}

class _SellerCardWidgetState extends State<SellerCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/sellerDetails');
      },
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            width: 5,
            color: widget.selected ? Colors.green : Color(0xffE2E2E2),
          ),
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      child: Image.asset(
                    widget.imagepath,
                    scale: 1,
                    fit: BoxFit.fitWidth,
                  ))),
              Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: widget.name,
                              fontWeight: FontWeight.w600,
                            ),
                            Text(widget.location)
                          ],
                        ),
                        IconButton(
                            icon: Icon(Icons.info),
                            onPressed: (){
                               //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SellerScreen(widget.name, widget.imagepath, widget.location)));
                            }
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
