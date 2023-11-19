// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../HomeScreen/home_screen.dart';
import '../ForgetPasswordScreen/forget_password_screen.dart';
import '../SignUpScreen/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //controllers for getting textFieldValue
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //global key control the form state and validate the user input
  final formKey = GlobalKey<FormState>();

  //functions

  //dispose controllers for memory leak
  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  //user login function
  Future<void> userLogin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ));
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Login successfully')));
    } on FirebaseAuthException catch (e) {
      print('The value is : $e');
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'No user found for that email.',
              style: TextStyle(color: Colors.white),
            )));
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              'Wrong password provided for that user.',
              style: TextStyle(color: Colors.white),
            )));
      }
    }
  }

  // Future<void> userLogin() async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim(),
  //         password: passwordController.text.trim());
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   }
  // }

  // Function to handle the login button click
  // void onLoginButtonClicked() {
  //   // Check the user registration status
  //   if (isUserRegistered) {
  //     // User is registered, perform login actions
  //     print('User is registered. Logging in...');
  //   } else {
  //     // User is not registered, show registration page or prompt
  //     print('User is not registered. Redirecting to registration page...');
  //   }
  // }

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
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network(
                          'https://assets6.lottiefiles.com/packages/lf20_k9wsvzgd.json',
                          animate: true,
                          height: 180,
                          width: 620),
                      Text(
                        'Log In Now',
                        style: GoogleFonts.poppins(
                            fontSize: 24.3,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff2D6F09)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Please login to continue using our app',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                              // height: 1.5,
                              fontSize: 15),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 362,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(20)),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextFormField(
                                  obscureText: false,
                                  controller: emailController,
                                  validator: (value) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = RegExp(pattern.toString());
                                    if (!regex.hasMatch(value!)) {
                                      return 'please enter valid email';
                                    } else if (value == null || value.isEmpty) {
                                      return 'email can\'t be null';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (val) {
                                    setState(() {
                                      // isEmailCorrect = isEmail(val);
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.green,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Email",
                                    hintText: 'your-email@domain.com',
                                    labelStyle: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: TextFormField(
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
                                  obscuringCharacter: '*',
                                  obscureText: true,
                                  onChanged: (value) {
                                    //password will store in value variable
                                  },
                                  decoration: const InputDecoration(
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.green,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.visibility_rounded,
                                      color: Colors.green,
                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: "Password",
                                    hintText: '*********',
                                    labelStyle: TextStyle(color: Colors.green),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    // userLogin();
                                    try {
                                      await FirebaseAuth.instance
                                          .signInWithEmailAndPassword(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      )
                                          .then((value) {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen()),
                                          (route) => false,
                                        );
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      if (e.message ==
                                          "An internal error has occurred. [ INVALID_LOGIN_CREDENTIALS ]") {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Email is not registered',
                                            ),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Incorrect email or password',
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                    // emailController.clear();
                                    // passwordController.clear();
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  padding: const EdgeInsets.all(18),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.green,
                                  ),
                                  child: const Text(
                                    'Log In',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Or login using',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/facebook.svg',
                                      height: 40,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/google.svg',
                                      height: 40,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      'assets/icons/twitter.svg',
                                      height: 40,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          print('forget password clicked');
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen(),
                            ));
                          },
                          child: const Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot password?'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You have\'t any account?',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              print('sign up clicked');
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
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
