import 'dart:async';

import 'package:cashbook_flutter/DashboardPage.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


//Example: https://github.com/MSzalek-Mobile/weight_tracker/blob/v0.2.1/lib/weight_entry_dialog.dart
class CashBookEntryDialog extends StatefulWidget {
  final CashBookItem cashbookEntryToEdit;

  CashBookEntryDialog.edit(this.cashbookEntryToEdit);
  CashBookEntryDialog.add() : cashbookEntryToEdit = null;

  @override
  CashBookEntryDialogState createState() {
    // TODO: implement createState
  }
}

class CashBookEntryDialogState extends State<CashBookEntryDialog>
{
  DateTime _dateTime = new DateTime.now();
  double _amount;

  CashBookEntryDialogState(this._dateTime, this._amount);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }


}



