import 'package:flutter/material.dart';

class TaskInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const TaskInputField(
      {required this.title,
      required this.hint,
      this.controller,
      this.widget,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.all(1),
          height: 50,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            border: Border.all(color: Colors.white, width: 3),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  controller: controller,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              width: 3, color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 3, color: Colors.transparent)),
                      labelText: hint,
                      labelStyle: TextStyle(fontSize: 10)),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ],
          ),
        ),
      ],
    );
  }
}
