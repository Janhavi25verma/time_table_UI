import 'package:flutter/material.dart';
import 'package:time_table_module/theme/palette.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/table.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                style:
                    GoogleFonts.poly(fontSize: 33, fontWeight: FontWeight.w400),
              ),
              Text(
                "with all the details",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 20, // Adjusted height
              ),
              Container(
                decoration: const BoxDecoration(),
                width:
                    MediaQuery.of(context).size.width, // Adjust width as needed
                child: SizedBox(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Adjust width as needed
                  child: const TimeTable(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
