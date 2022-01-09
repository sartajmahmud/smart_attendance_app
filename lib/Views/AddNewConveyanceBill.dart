import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:smart_attendance/Widgets/app_button.dart';

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
          height: 95,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: AppButton(
            label: "Confirm",
            fontWeight: FontWeight.w600,
            padding: EdgeInsets.symmetric(vertical: 30),
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
              // AppText(text: 'Select Seller'),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: SearchableDropdown.single(
              //     items: _sellers.map((cat) {
              //       return DropdownMenuItem(
              //         child: InkWell(
              //           onTap: () {
              //             if (cat != _sellerName) {
              //               setState(() {
              //                 _sellerName = cat;
              //                 Navigator.pop(context);
              //               });
              //             }
              //           },
              //           child: Container(
              //             width: MediaQuery.of(context).size.width - 65,
              //             child: new Text(
              //               cat,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ),
              //         ),
              //         value: cat,
              //       );
              //     }).toList(),
              //     value: _sellerName,
              //     hint: "Select Seller",
              //     searchHint: "Select Seller",
              //     onChanged: (newValue) {},
              //     isExpanded: true,
              //   ),
              // ),
              // BasicDateField('s'),
              // AppText(text: 'Reference'),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextField(),
              // ),

              // Row(
              //   children: [
              //     Expanded(
              //         flex: 5,
              //         child: FormField<String>(
              //           builder: (FormFieldState<String> state) {
              //             return InputDecorator(
              //               decoration: InputDecoration(
              //                   //labelStyle: textStyle,
              //                   errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
              //                   hintText: 'Please select expense',
              //                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
              //               isEmpty: _currentSelectedValue == '',
              //               child: DropdownButtonHideUnderline(
              //                 child: DropdownButton<String>(
              //                   value: _currentSelectedValue,
              //                   isDense: true,
              //                   onChanged: (String newValue) {
              //                     setState(() {
              //                       _currentSelectedValue = newValue;
              //                       state.didChange(newValue);
              //                     });
              //                   },
              //                   items: _currencies.map((String value) {
              //                     return DropdownMenuItem<String>(
              //                       value: value,
              //                       child: Text(value),
              //                     );
              //                   }).toList(),
              //                 ),
              //               ),
              //             );
              //           },
              //         )),
              //     Expanded(
              //         flex: 1,
              //         child: Padding(
              //           padding: const EdgeInsets.fromLTRB(0,5,0,5),
              //           child: TextField(
              //             decoration: new InputDecoration(
              //               enabledBorder: const OutlineInputBorder(
              //                 borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              //               ),
              //               border: new OutlineInputBorder(
              //                   borderSide: new BorderSide(color: Colors.teal)
              //               ),
              //             ),
              //           ),
              //         )),
              //     Expanded(
              //         flex: 1,
              //         child: IconButton(
              //           onPressed: (){},
              //           icon: Icon(Icons.add),
              //         )
              //     ),
              //   ],
              // ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *.75,
                child: ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AppText(text: 'Bill Entry # ${index+1}'),
                            ),
                            Row(
                              children: [
                                Expanded(flex: 7, child: AppText(text: 'Bill Type')),
                                Expanded(flex: 2, child: AppText(text: 'Amount')),
                                Expanded(flex: 1, child: Text('')),
                                Expanded(flex: 1, child: Text('')),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Padding(
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
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width -
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
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: TextField(
                                        controller: TextEditingController(text: "1"),
                                        decoration: new InputDecoration(
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          border: new OutlineInputBorder(
                                              borderSide:
                                              new BorderSide(color: Colors.teal)),
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: index == itemCount - 1
                                        ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          itemCount++;
                                          print(itemCount);
                                        });
                                      },
                                      icon: Icon(Icons.add),
                                    )
                                        : Container()),
                                Expanded(
                                    flex: 1,
                                    child: index == itemCount - 1
                                        ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (itemCount != 1){
                                            itemCount--;
                                          }

                                          print(itemCount);
                                        });
                                      },
                                      icon: Icon(Icons.remove),
                                    )
                                        : Container()),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(flex: 2, child: Column(
                                  children: [
                                    BasicDateField('Date'),
                                  ],
                                )),
                                Expanded(flex: 3, child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(text: 'Note'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        decoration: new InputDecoration(
                                          enabledBorder: const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey, width: 1.0),
                                          ),
                                          border: new OutlineInputBorder(
                                              borderSide:
                                              new BorderSide(color: Colors.teal)),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            )
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppText(text:title),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DateTimeField(
              format: format,
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),
          ),
        ]);
  }
}