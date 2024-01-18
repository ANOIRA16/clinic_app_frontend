import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FxTasksList extends StatelessWidget {
  final List<String> dateList = [
    "21July | 08:30-09:30",
    "22July | 10:00-11:00",
    "22July | 14:00-15:00",
    "24July | 16:30-17:30",
  ];

  final List<String> descriptionList = [
    "Urgent Surgeries : Internal bleeding and broken ribs",
    "Wound Treatment : Cuts and bruises on both knees",
    "Medical Checkup : Room 11",
    "Medication Review : Mr&Mrs Smith",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          descriptionList.length,
              (index) => TaskCard(
            date: dateList[index],
            description: descriptionList[index],
          ),
        ),
      ),
    );
  }
}

class TaskCard extends StatefulWidget {
  final String date;
  final String description;

  TaskCard({required this.date, required this.description});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          CheckboxListTile(
            title: Text(
              widget.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isChecked ? Colors.grey : Colors.black,
                decoration: isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
            subtitle: Text(
              widget.date,
              style: TextStyle(
                color: isChecked ? Colors.grey : Colors.black,
                decoration: isChecked ? TextDecoration.lineThrough : null,
              ),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}
