import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import '../Widgets/app_button.dart';
import 'app_text.dart';

class AddNewConveyanceBill extends StatefulWidget {
  const AddNewConveyanceBill();

  @override
  _AddNewConveyanceBillState createState() => _AddNewConveyanceBillState();
}

class _AddNewConveyanceBillState extends State<AddNewConveyanceBill> {
  int itemCount = 1;
  var _sellerName;
  var _sellers = [
    "ABC Company",
    "XYZ Company",
    "EFG Company",
    "HIJ Company",
  ];
  var _productName;
  var _products = [
    "BIZOL Moto 5W-40",
    "BIZOL Moto 10W-40",
    "BIZOL Moto 20W-50",
    "BIZOL Green Oil+ 5W-30",
    "BIZOL Green Oil 5W-40",
    "BIZOL Allround 0W-20",
    "BIZOL Allround 5W-40",
    "BIZOL Allround 10W-40"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppButton(
            label: "Save",
            fontWeight: FontWeight.w600,
            onPressed: () {
              ///post to add new sales order and redirect to sales order list screen
            },
          ),
        ),
      ),
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
            text: "Add New Conveyance Bill",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .75,
                child: ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AppText(text: 'Bill Entry # ${index + 1}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 10, 5),
                              child: SearchableDropdown.single(
                                items: _products.map((cat) {
                                  return DropdownMenuItem(
                                    child: InkWell(
                                      onTap: () {
                                        if (cat != _productName) {
                                          setState(() {
                                            _productName = cat;
                                            Navigator.pop(context);
                                          });
                                        }
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                65,
                                        child: new Text(
                                          cat,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    value: cat,
                                  );
                                }).toList(),
                                value: _productName,
                                hint: "Select Bill Type",
                                searchHint: "Select Bill Type",
                                onChanged: (newValue) {},
                                isExpanded: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                autofocus: true,
                                decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Taka",
                                    hintText: "Taka"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                decoration: new InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Note",
                                    hintText: "Note"),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: BasicDateField('Date'),
                            ),
                            index == itemCount - 1
                                ? FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        itemCount++;
                                        print(itemCount);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        Text('Add More'),
                                        Icon(Icons.add),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.end,
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");
  String title;
  BasicDateField(this.title);
  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      initialValue: DateTime.now(),
      format: format,
      decoration: new InputDecoration(
          border: OutlineInputBorder(), labelText: "Date", hintText: "Date",),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(2001),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    );
  }
}
