import 'package:flutter/material.dart';
import 'package:time_table_module/core/faculty_table.dart';
import 'package:time_table_module/core/student_data_elevated_button.dart';
import 'package:time_table_module/theme/palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/time_table.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});

  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.purpleColor,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: Icon(
                Icons.notifications_none_outlined,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 18),
              child: SizedBox(
                width: 37,
                height: 38,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/image.png'),
                ),
              ),
            ),
          ],
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        drawer: const Drawer(
          surfaceTintColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(width: 2),
                      ),
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search, size: 25)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Watch your schedule!",
                  style: GoogleFonts.poly(
                      fontSize: 33, fontWeight: FontWeight.w400),
                ),
                Text(
                  "with all the details",
                  style: GoogleFonts.poppins(
                      fontSize: 24, fontWeight: FontWeight.w300),
                ),
                const SizedBox(
                  height: 20, // Adjusted height
                ),

                //DownloadButton

                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Palette.lightPurpleColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                    ),
                    child: Text(
                      "Download",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              StudentDataElevatedButton(text: "Branch:CSE"),
                              StudentDataElevatedButton(text: "Year:2023-24"),
                              StudentDataElevatedButton(text: "Year:CSE-3"),
                              StudentDataElevatedButton(text: "Semester:3rd"),
                            ],
                          ),
                        ),
                        SizedBox(height: 250, child: TimeTable()),
                      ]),
                ),
                const SizedBox(
                  height: 10,
                ),
                //FacultyTable

                Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: const SizedBox(height:200,width:double.maxFinite,child: FacultyTable()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
