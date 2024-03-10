import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FacultyTable extends StatefulWidget {
  const FacultyTable({super.key});

  @override
  State<FacultyTable> createState() => _FacultyTableState();
}

class _FacultyTableState extends State<FacultyTable> {
  final List<String> subjectCode = ['ABCD', 'ABCD', 'ABCD', 'ABCD'];
  final List<String> subjectName = [
    'xxxxxxxx',
    'xxxxxxxx',
    'xxxxxxxx',
    'xxxxxxxx'
  ];
  final List<String> facultyName = [
    'fullName',
    'fullName',
    'fullName',
    'fullName'
  ];

  List<DataRow> buildDataRowForSubjectCode() {
    List<DataRow> dataRows = [];

    for (String subjectCode in subjectCode) {
      dataRows.add(DataRow(cells: [
        DataCell(
          Container( padding: EdgeInsets.zero,
              child: Text(subjectCode,style: GoogleFonts.poppins(fontSize: 12),)),
        )
      ]));
    }
    return dataRows;
  }

  List<DataRow> buildDataRowForSubjectName() {
    List<DataRow> dataRows = [];

    for (String subjectName in subjectName) {
      dataRows.add(DataRow(cells: [
        DataCell(
          Container( padding: EdgeInsets.zero,
              child: Text(subjectName,style: GoogleFonts.poppins(fontSize: 12),)),
        )
      ]));
    }
    return dataRows;
  }

  List<DataRow> buildDataRowForFacultyName() {
    List<DataRow> dataRows = [];

    for (String facultyName in facultyName) {
      dataRows.add(DataRow(cells: [
        DataCell(
          Container( padding: EdgeInsets.zero,
              child: Text(facultyName,style: GoogleFonts.poppins(fontSize: 12),)),
        )
      ]));
    }
    return dataRows;
  }

  @override
  Widget build(BuildContext context) {
    List<DataRow> allSubjectCodeDataRows = [...buildDataRowForSubjectCode()];
    List<DataRow> allSubjectNameDataRows = [...buildDataRowForSubjectName()];
    List<DataRow> allFacultyNameDataRows = [...buildDataRowForFacultyName()];
    return SingleChildScrollView(
      child: Row(
          children:<Widget> [
            Flexible(
              child: DataTable(
                  dataRowMinHeight: 20,
                  dataRowMaxHeight: 33,
                  columnSpacing: 5,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Subject Code",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12,),
                      ),
                    )
                  ],
                  rows: allSubjectCodeDataRows),
            ),
            Flexible(
              child: DataTable(
                  dataRowMinHeight: 20,
                  dataRowMaxHeight: 33,
                  columnSpacing: 5,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Subject Name",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                  rows: allSubjectNameDataRows),
            ),
            Flexible(
              child: DataTable(
                  dataRowMinHeight: 20,
                  dataRowMaxHeight: 33,
                  columnSpacing: 5,
                  columns: [
                    DataColumn(
                      label: Text(
                        "Faculty Name",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                  rows: allFacultyNameDataRows),
            )
          ]),
    );
  }
}
