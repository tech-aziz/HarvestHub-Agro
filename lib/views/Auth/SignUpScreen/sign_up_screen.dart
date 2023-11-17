import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvest_hub_agro/views/HomeScreen/home_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/config.dart';
import '../LoginScreen/login_screen1.dart';
import '../OtpScreen/otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _number = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _name.clear();
    _email.clear();
    _number.clear();
    _password.clear();
    _confirmPassword.clear();
    super.dispose();
  }

  // final auth = FirebaseAuth.instance;
  Future<void> signUp() async {
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text, password: _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: AssetImage('assets/images/bg.jpg'),
                fit: BoxFit.cover,
                opacity: 0.6)),
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Lottie.asset(
                            animate: true,
                            'assets/lottie/sign_up.json',
                            width: 200),
                        Text(
                          AppConfig.createAccountText,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        customTextField(
                            controller: _name,
                            textLevel: 'Full Name',
                            hintText: 'Enter your name',
                            context: context,
                            textColor: Colors.white,
                            prefixIcon: Icons.person),
                        const SizedBox(
                          height: 6,
                        ),
                        customTextField(
                          controller: _email,
                          textLevel: 'Email Address',
                          hintText: 'Enter your email address',
                          context: context,
                          textColor: Colors.white,
                          prefixIcon: Icons.email,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        customTextField(
                            controller: _number,
                            textLevel: 'Phone Number',
                            hintText: 'Enter your phone number',
                            context: context,
                            textColor: Colors.white,
                            prefixIcon: Icons.phone),
                        const SizedBox(
                          height: 6,
                        ),
                        customTextField(
                            controller: _password,
                            textLevel: 'Password',
                            hintText: 'Enter your phone password',
                            context: context,
                            textColor: Colors.white,
                            prefixIcon: Icons.lock),
                        const SizedBox(
                          height: 6,
                        ),
                        customTextField(
                            controller: _confirmPassword,
                            textLevel: 'Confirm Password',
                            hintText: 'Confirm your password',
                            context: context,
                            textColor: Colors.white,
                            suffixIcon:   Icons.visibility_rounded,
                            prefixIcon: Icons.check)
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                        onTap: () {
                          if(_email.text.isNotEmpty && _password.text.length > 6){
                           try{
                             signUp();
                             ScaffoldMessenger.of(context).showSnackBar(
                                 const SnackBar(
                                     content: Text('User is created successfully')));
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                     builder: (context) => const HomeScreen()));

                           }on FirebaseAuthException catch(e){
                             print(e);
                           }
                          }else{
                            debugPrint('Email is empty or password is empty');
                          }
                        },
                        child: customButton(
                          label: 'NEXT',
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
