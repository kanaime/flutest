import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

class CalendarContainer extends StatelessWidget {
  const CalendarContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: Colors.blue,
        selectedTextColor: Colors.white,
        dateTextStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey),
        locale: "fr_CH",
      ),
    );
  }
}
