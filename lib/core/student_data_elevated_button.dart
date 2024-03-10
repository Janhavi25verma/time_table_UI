import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDataElevatedButton extends StatelessWidget {
  final String text;
  const StudentDataElevatedButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          padding: const EdgeInsets.all(3),
          elevation: 1,
          shadowColor: Colors.grey,
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: Colors.black),
        ),
      );
  }
}
