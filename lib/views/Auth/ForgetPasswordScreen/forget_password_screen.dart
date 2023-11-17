import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Lottie.asset('assets/lottie/forgot.json',
                  animate: true, height: 220, width: 600),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Reset Password',
                style: GoogleFonts.poppins(
                    fontSize: 23.3,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff2D6F09)),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, bottom: 15, top: 15),
                child: TextFormField(
                  // controller: _email,
                  onChanged: (val) {
                    setState(() {
                      // isEmailCorrect = isEmail(val);
                    });
                  },
                  decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "New Password",
                      hintText: 'Enter your new password',
                      labelStyle: const TextStyle(color: Colors.green),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon:
                              const Icon(Icons.security, color: Colors.green))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print('send request clicked');
                },
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Send request',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
