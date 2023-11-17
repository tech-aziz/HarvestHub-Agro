import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_container.dart';
import '../../../utils/config.dart';
import '../../FarmDetailScreen/farm_detail_screen.dart';


class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new_rounded))),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    'assets/images/otp_screen_image.jpg',
                    height: 280,
                  ),
                  Text(AppConfig.phoneVerificationText,
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.green
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppConfig.codeSendText,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customContainer(number: 5),
                      customContainer(number: 7),
                      customContainer(number: 5),
                      customContainer(number: 5),
                      customContainer(number: 5)
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                   Row(
                    children: [
                      Text('Don’t receive code? ',style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 16),),
                      InkWell(
                        onTap: () {
                          print('get via call clicked');
                        },
                        child: Text('Request again Get via Call',style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 110,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FarmDetailScreen(),
                  ));
                },
                child: customButton(
                  label: 'Verify',
                  backgroundColor: const Color(0xff31F920),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
