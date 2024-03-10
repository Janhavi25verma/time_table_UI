import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  Map<String, List<String>> subjectRowMap = {
    "monday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
    "tuesday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
    "wednesday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
    "thursday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
    "friday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
    "saturday": [
      "subject",
      "subject",
      "Break",
      "subject",
      "subject",
      "subject",
      "Break",
      "subject",
      "subject"
    ],
  };
  List<String> time = [
    "8:30-9:20",
    "9:20-10:10",
    "10:10-11:00",
    "11:00-11:50",
    "11:50-12:40",
    "12:40-1:30",
    "1:30-2:20",
    "2:20-3:10",
    "3:10-4:00"
  ];

  List<DataRow> buildDataRowsForDay(String day) {
    List<DataRow> dataRows = [];
    List<String>? subjects = subjectRowMap[day];
    List<DataCell> cells = [];
    if (subjects != null) {
      for (int i = 0; i < subjects.length; i++) {

        cells.add(DataCell(Text(subjects[i])));
      }
        dataRows.add(DataRow(cells: cells));

    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      for (String slot in time) DataColumn(label: Text(slot)),
    ];
    List<DataRow> allDataRows = [
      for (String day in subjectRowMap.keys) ...buildDataRowsForDay(day),
    ];
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(columns: columns, rows: allDataRows),
          ),
        ), //classes
      ],
    );
  }
}
