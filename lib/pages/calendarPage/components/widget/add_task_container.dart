import 'package:flutest/pages/TaskPage/CreateTask/add_task_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addTaskContainer extends StatelessWidget {
  const addTaskContainer({
    Key? key,
    required this.dateFormat,
    required this.dateTime,
  }) : super(key: key);

  final DateFormat dateFormat;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Aujourd'hui",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    dateFormat.format(dateTime),
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddTaskForm()),
                );
              },
              child: Text(
                "+ Tache",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)),
            )
          ],
        ),
      ),
    );
  }
}
