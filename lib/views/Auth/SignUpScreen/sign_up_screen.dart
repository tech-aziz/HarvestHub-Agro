import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:harvest_hub_agro/views/HomeScreen/home_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../utils/config.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //variables

  //controllers for getting textFieldValue
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  //global key control the form state and validate the user input
  final formKey = GlobalKey<FormState>();

  //functions

  //dispose controllers for memory leak
  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    numberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    super.dispose();
  }

  //user signup function
  final auth = FirebaseAuth.instance;

  Future<void> userSignUp() async {
    await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
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
                child: Form(
                  key: formKey,
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
                                fontSize: 26,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          customTextField(
                              keyboardType: TextInputType.text,
                              controller: nameController,
                              obscureText: false,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter name';
                                }
                              },
                              textLevel: 'Full Name',
                              hintText: 'Enter your name',
                              context: context,
                              textColor: Colors.white,
                              prefixIcon: Icons.person),
                          const SizedBox(
                            height: 6,
                          ),
                          customTextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            obscureText: false,
                            validator: (value) {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regex = RegExp(pattern.toString());
                              if (!regex.hasMatch(value!)) {
                                return 'Enter Valid Email';
                              } else {
                                return null;
                              }
                            },
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
                              keyboardType: TextInputType.phone,
                              controller: numberController,
                              obscureText: false,
                              validator: (value) {
                                String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                                RegExp regExp = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return 'Please enter mobile number';
                                } else if (!regExp.hasMatch(value)) {
                                  return 'Please enter valid mobile number';
                                }
                                return null;
                              },
                              textLevel: 'Phone Number',
                              hintText: 'Enter your phone number',
                              context: context,
                              textColor: Colors.white,
                              prefixIcon: Icons.phone),
                          const SizedBox(
                            height: 6,
                          ),
                          customTextField(
                            obscureText: true,
                              validator: (value) {
                                String pattern =
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                RegExp regExp = RegExp(pattern);

                                if (value!.isEmpty) {
                                  return 'Please enter password';
                                } else {
                                  if (!regExp.hasMatch(value)) {
                                    return 'Enter valid password';
                                  } else {
                                    return null;
                                  }
                                }
                              },
                              controller: passwordController,
                              textLevel: 'Password',
                              hintText: 'Enter your phone password',
                              context: context,
                              textColor: Colors.white,
                              prefixIcon: Icons.lock),
                          const SizedBox(
                            height: 6,
                          ),
                          customTextField(
                            obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is empty';
                                }
                                if (value != passwordController.text) {
                                  return 'Password not match';
                                }
                                return null;
                              },
                              controller: confirmPasswordController,
                              textLevel: 'Confirm Password',
                              hintText: 'Confirm your password',
                              context: context,
                              textColor: Colors.white,
                              suffixIcon: Icons.visibility_rounded,
                              prefixIcon: Icons.check)
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              try {
                                userSignUp();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'User is created successfully')));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  print('The password provided is too weak.');
                                } else if (e.code == 'email-already-in-use') {
                                  print(
                                      'The account already exists for that email.');
                                }
                              }
                            } else {
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
      ),
    );
  }
}
