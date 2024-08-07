import 'package:date_and_time_/network/notification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeComponent extends StatefulWidget {
  const DateTimeComponent({Key? key}) : super(key: key);

  @override
  State<DateTimeComponent> createState() => _DateTimeComponentState();
}

class _DateTimeComponentState extends State<DateTimeComponent> {
  DateTime _selecteddate = DateTime.now();
  TimeOfDay _selectdtime = TimeOfDay.now();

  String get getdate {
    return DateFormat('dd-MMM-yyyy').format(_selecteddate);
  }

  String get gettime {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.day, now.month, now.year, _selectdtime.hour, _selectdtime.minute);
    return DateFormat('hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => OpendatePicker(),
                    child: Text('select date')),
                Text('$getdate')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () => OpenTimePicker(),
                    child: Text('select time')),
                Text('$gettime')
              ],
            ),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () => () {
                      Notifications()
                          .showNotification(title: 'welcome bonus', id: 2);
                    },
                child: Text('select time')),
          )
        ],
      ),
    );
  }

  Future<void> OpendatePicker() async {
    final selectedData = await showDatePicker(
        context: context,
        initialDate: _selecteddate,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());

    if (selectedData != null) {
      setState(() {
        _selecteddate = selectedData;
      });
    }
  }

  Future<void> OpenTimePicker() async {
    final selectedTime =
        await showTimePicker(context: context, initialTime: _selectdtime);
    if (selectedTime != null) {
      setState(() {
        _selectdtime = selectedTime;
      });
    }
  }
}
