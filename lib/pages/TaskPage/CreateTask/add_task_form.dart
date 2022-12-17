import 'dart:ui';

import 'package:flutest/components/navbar/custom_top_navbar.dart';
import 'package:flutest/components/utils%20widget/button_back.dart';
import 'package:flutest/pages/TaskPage/CreateTask/widget/create_task_input.dart';
import 'package:flutest/pages/calendarPage/components/widget/Input_Field_Task.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  var _selectedDate = DateTime.now();
  String? _startTime =
      DateFormat("hh:mm a", "fr_CH").format(DateTime.now()).toString();
  String _endTime = "11:22";

  _getDatePicker() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2030));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("it's null or something it's wong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("time cancel");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() async {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
          //_startTime --> 10:30
          hour: int.parse(_startTime!.split(":")[0]),
          minute: int.parse(_startTime!.split(":")[1].split(" ")[0]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Navbar(
          text: 'formulaire',
          back: BackButtonNav(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Container(
                child: Text(
                  "Nouvelle tache",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            TaskInputField(
              title: "Titre",
              hint: 'Ajouter un titre',
            ),
            TaskInputField(
              title: "Note",
              hint: 'Ajouter une description',
            ),
            TaskInputField(
              title: "Date",
              hint: DateFormat.yMd("fr_CH").format(_selectedDate),
              widget: IconButton(
                icon: Icon(Icons.calendar_today_outlined),
                color: Colors.grey[600],
                onPressed: () {
                  _getDatePicker();
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TaskInputField(
                  title: "Début",
                  hint: _startTime!,
                  widget: IconButton(
                    onPressed: (() {
                      _getTimeFromUser(isStartTime: true);
                    }),
                    icon: Icon(Icons.access_time_rounded),
                    color: Colors.grey[600],
                  ),
                )),
                Expanded(
                    child: TaskInputField(
                  title: "Fin",
                  hint: _endTime,
                  widget: IconButton(
                    onPressed: (() {
                      _getTimeFromUser(isStartTime: false);
                    }),
                    icon: Icon(Icons.access_time_rounded),
                    color: Colors.grey[600],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
