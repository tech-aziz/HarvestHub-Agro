import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_button.dart';
import '../../utils/config.dart';
import '../Auth/LoginScreen/login_screen1.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.6)),
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 225,
                            width: 223,
                          ),
                          Positioned(
                            top: 35,
                            left: 40,
                            child: Text(
                              AppConfig.getStartedText1,
                              style: GoogleFonts.poppins(
                                  fontSize: 29,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 320,
                      height: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(39),
                          image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/green_farming.png',
                              ))),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(AppConfig.getStartedText3,
                          style: GoogleFonts.poppins(
                              fontSize: 23.3,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const loginScreen(),));
                  },
                  child: customButton(
                    label: 'Get Started',
                    textColor: Colors.white,
                    backgroundColor: Colors.green.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
