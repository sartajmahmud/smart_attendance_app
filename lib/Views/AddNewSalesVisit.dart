import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'app_text.dart';

class AddNewSalesVisit extends StatefulWidget {
  const AddNewSalesVisit();

  @override
  _AddNewSalesVisitState createState() => _AddNewSalesVisitState();
}

class _AddNewSalesVisitState extends State<AddNewSalesVisit> {
  var _selectedClientCategory;
  var visitedClientCategory = [
    "Automotive/Corporate",
    "Dealer/Retailer",
  ];
  var _sellers = [
    "ABC Company",
    "XYZ Company",
    "EFG Company",
    "HIJ Company",
  ];
  var _selectedProductCategory;
  var _productCategory = [
    "Car Engine Oil",
    "Motorcycle Oil",
    "Grease",
    "Coolant",
  ];

  bool _checked  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            text: "Add New Sales Visit",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                AppText(text: 'Select Seller'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchableDropdown.single(
                    items: visitedClientCategory.map((cat) {
                      return DropdownMenuItem(
                        child: InkWell(
                          onTap: () {
                            if (cat != _selectedClientCategory) {
                              setState(() {
                                _selectedClientCategory = cat;
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 65,
                            child: new Text(
                              cat,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        value: cat,
                      );
                    }).toList(),
                    value: _selectedClientCategory,
                    hint: "Select Client Category",
                    searchHint: "Select Client Category",
                    onChanged: (newValue) {},
                    isExpanded: true,
                  ),
                ),
                AppText(text: 'Name of The Visited Client'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(),
                ),
                AppText(text: 'Name of the contact person'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(),
                ),
                AppText(text: 'Client Contact Details'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(),
                ),
                AppText(text: 'Business with Existing Brand'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.2,
                  child: GridView.builder(
                    itemCount: _sellers.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      childAspectRatio: 3
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new CheckboxListTile(
                          title: Text(_sellers[index]),
                            value: _checked,
                            onChanged: (val){
                            setState(() {
                              _checked = val;
                            });
                            },
                          activeColor: Colors.green,
                          checkColor: Colors.black,
                        ),
                      );
                    },
                  ),
                ),
                AppText(text: 'Present Product Category'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SearchableDropdown.single(
                    items: _productCategory.map((cat) {
                      return DropdownMenuItem(
                        child: InkWell(
                          onTap: () {
                            if (cat != _selectedProductCategory) {
                              setState(() {
                                _selectedProductCategory = cat;
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 65,
                            child: new Text(
                              cat,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        value: cat,
                      );
                    }).toList(),
                    value: _selectedProductCategory,
                    hint: "Select Product Category",
                    searchHint: "Select Product Category",
                    onChanged: (newValue) {},
                    isExpanded: true,
                  ),
                ),
                AppText(text: 'Present Product Consumption'),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*.2,
                  child: GridView.builder(
                    itemCount: _productCategory.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(_productCategory[index]),
                            Container(
                              width: 60,
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
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
