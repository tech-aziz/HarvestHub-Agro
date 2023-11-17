import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customButton(
    {Color? backgroundColor,
    Color? textColor,
    String? icon,
    required String label}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700, fontSize: 24, color: textColor),
            ),
          ],
        )),
  );
}
