import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_table_module/theme/palette.dart';

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

  List<DataRow> buildDataRowsForSubjects(String day) {
    List<DataRow> dataRows = [];
    List<String>? subjects = subjectRowMap[day];
    List<DataCell> cells = [];
    if (subjects != null) {
      for (int i = 0; i < subjects.length; i++) {
        cells.add(DataCell(Container(

            padding: EdgeInsets.all(2.5),
            decoration:  BoxDecoration(boxShadow: [BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 0.1,
              spreadRadius: 0.1,
            ), //BoxShadow
              const BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),],),
            child: Text(subjects[i]))));
      }
      dataRows.add(DataRow(cells: cells));
    }
    return dataRows;
  }

  List<DataRow> buildDataRowForDay() {
    List<DataRow> dataRows = [];

    for (String day in subjectRowMap.keys) {
      dataRows.add(DataRow(cells: [DataCell(Text(day),)]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = [
      for (String slot in time) DataColumn(label: Text(slot)),
    ];

    List<DataRow> allSubjectDataRows = [
      for (String day in subjectRowMap.keys) ...buildDataRowsForSubjects(day),
    ];
    List<DataRow> allDayDataRows = [...buildDataRowForDay()];


    return Row(
      children: [
        SingleChildScrollView(
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              dividerTheme: const DividerThemeData(
                color: Colors.transparent,
                space: 0,
                thickness: 0,
                indent: 0,
                endIndent: 0,
              ),
            ),
            child: DataTable(

                dividerThickness: 0,
                decoration: BoxDecoration(
                    border: Border.symmetric(
                  vertical:
                      BorderSide(width: 1, color: Colors.grey.withOpacity(0.4)),
                )),
                dataRowMinHeight: 20,
                dataRowMaxHeight: 33,
                border: const TableBorder(horizontalInside: BorderSide.none),
                columns: const [DataColumn(label: Text("Day"))],
                rows: allDayDataRows),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                dividerTheme: const DividerThemeData(
                  color: Colors.transparent,
                  space: 0,
                  thickness: 0,
                  indent: 0,
                  endIndent: 0,

                ),
              ),
              child: DataTable(
                  dataTextStyle: GoogleFonts.poppins(),
                  columnSpacing: 13,
                  dataRowMinHeight: 17,
                  dataRowMaxHeight: 33,
                  columns: columns,
                  rows: allSubjectDataRows),
            ),
          ),
        ), //classes
      ],
    );
  }
}
