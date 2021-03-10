import 'package:flutter/material.dart';
import 'package:foodaholic_rider_app/generated/l10n.dart';
import 'package:foodaholic_rider_app/src/controllers/order_controller.dart';
import 'package:foodaholic_rider_app/src/models/statistic.dart';
import 'package:foodaholic_rider_app/src/repository/settings_repository.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


class Earning extends StatefulWidget {
  @override
  _EarningState createState() => _EarningState();
}

class _EarningState extends StateMVC<Earning> {
  OrderController _con;

  _EarningState() : super(OrderController()) {
    _con = controller;
  }
  @override
  void initState() {
    Statistic statics=new Statistic ();
    Statistic statics1=new Statistic ();
    statics.value="0";
    statics1.value="0";
    _con.statistics1.add(statics);
    _con.statistics1.add(statics1);
    // TODO: implement initState
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      final DateTime rangeStartDate = args.value.startDate;
      final DateTime rangeEndDate = args.value.endDate;
      if(rangeStartDate!=null && rangeEndDate!=null){
        setState(() {
          _con.listenForStatisticsFilter(start: args.value.startDate,end: args.value.endDate);
        });
      }
    } else if (args.value is DateTime) {
      final DateTime selectedDate = args.value;
    } else if (args.value is List<DateTime>) {
      final List<DateTime> selectedDates = args.value;
    } else {
      final List<PickerDateRange> selectedRanges = args.value;
    }

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Theme.of(context).hintColor),
          onPressed: () => Navigator.pop(context),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).earning,
          style: Theme.of(context)
              .textTheme
              .headline6
              .merge(TextStyle(letterSpacing: 1.3)),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            child: Card(
              child: SfDateRangePicker(
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                minDate: DateTime.now().subtract(Duration(days: 30)) ,
                maxDate: DateTime.now().add(Duration(days: 30)),
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            leading: Icon(
              Icons.attach_money,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              "Total Earning",
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: RichText(
                softWrap: false,
                overflow: TextOverflow.fade,
                maxLines: 1,
                text: TextSpan(
                  text: setting.value?.defaultCurrency,
                  style:  Theme.of(context).textTheme.subtitle1.merge(
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  children: <TextSpan>[
                    TextSpan(text: _con.statistics1[0].value,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    // TextSpan(text: _con.statistics.length > 1 ? _con.statistics[1].value.toString() : _con.statistics[0].value.toString(),
                    //   style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                    // ),
                  ],
                )
            ),
            //subtitle: SizedBox(width: 0),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            leading: Icon(
              Icons.payment,
              color: Theme.of(context).hintColor,
            ),
            title: Text(
              "Total Order",
              style: Theme.of(context).textTheme.headline4,
            ),
            trailing: RichText(
                softWrap: false,
                overflow: TextOverflow.fade,
                maxLines: 1,
                text: TextSpan(
                  text:  _con.statistics1[1].value,
                  style:  Theme.of(context).textTheme.subtitle1.merge(
                    TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  ),
                )
            ),
            //subtitle: SizedBox(width: 0),
          ),
        ],
      ),
    );
  }


}
