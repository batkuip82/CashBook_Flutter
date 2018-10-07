import 'dart:async';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';

class CashBookEntry {
  CashBookEntry(String date, String amount) {
    entryDate = date;
    entryAmount = amount;
  }

  String entryDate;
  String entryAmount;
}

class DashBoardState extends State<DashBoard> {
  TextEditingController valueController = TextEditingController();
  final List<CashBookEntry> items = List();
  static TextField amountField;

  @override
  void initState() {
    super.initState();
    amountField = TextField(
        controller: valueController,
        decoration: InputDecoration(labelText: "Amount"),
        keyboardType: TextInputType.number);
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    valueController.dispose();
    super.dispose();
  }

  String _dateValue = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2016),
        lastDate: new DateTime(2019));
    if (picked != null)
      setState(() => _dateValue = formatDate(picked, [yyyy, '-', mm, '-', dd]));
  }

  //final dateSection = Container();
  // final Container categorySection = Container(child: RaisedButton(onPressed: _selectDate, child: new Text('Click me'),));
  final amountSection = Container(child: amountField);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard!"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Row(children: <Widget>[
              Row(children: [
                IconButton(
                    icon: Icon(Icons.date_range),
                    onPressed: () => _selectDate()),
                Text(_dateValue)
              ]),
              Container(
                width: 10.0,
              ),
              Expanded(child: amountField)
            ]),
            Container(height: 20.0),
            Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(items[index].entryDate),
                              Text(items[index].entryAmount),
                            ])))
          ])),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          items.add(CashBookEntry(_dateValue, valueController.text));
          valueController.clear();
          setState(() {});
          // return showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       // Retrieve the text the user has typed in using our
          //       // TextEditingController
          //       content: Text(valueController.text),
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.add),
      ),
    );
  }
}

class DashBoard extends StatefulWidget {
  DashBoard({Key key}) : super(key: key);

  @override
  DashBoardState createState() => new DashBoardState();
}
