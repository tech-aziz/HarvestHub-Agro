import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customContainer({required int number}) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1.6, color: Colors.black.withOpacity(0.5))),
    child: Center(
        child: Text(
      number.toString(),
      style: GoogleFonts.poppins(
          fontSize: 30, fontWeight: FontWeight.w400, color: Colors.black),
    )),
  );
}
