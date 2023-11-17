import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../OnbordingScreen/onbording_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer( const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  const OnBoardingScreen(),));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      // backgroundColor: AppColors.bgColorDarkTheme,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Lottie.asset(
                animate: true,
                'assets/lottie/crop_lottie.json',
                width: size.width,
              ),
               Text(
                 'HarvestHub Agro',
                 style: GoogleFonts.poppins(
                     fontSize: 25,
                     fontWeight: FontWeight.w700,
                     color: const Color(0xff0D5E06)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
