import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutest/pages/calendarPage/components/widget/add_task_container.dart';
import 'package:flutest/pages/calendarPage/components/widget/calendar_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class BodyCalendar extends StatefulWidget {
  const BodyCalendar({super.key});

  @override
  State<BodyCalendar> createState() => _BodyCalendarState();
}

class _BodyCalendarState extends State<BodyCalendar> {
  late DateFormat dateFormat;
  late DateFormat timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('fr_CH');
    timeFormat = new DateFormat.Hms('fr_CH');
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();

    return Column(
      children: [
        addTaskContainer(dateFormat: dateFormat, dateTime: dateTime),
        CalendarContainer(),
        Container(
          child: Text("Date Pick"),
        )
      ],
    );
  }
}
