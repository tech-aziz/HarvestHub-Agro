import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../HomeScreen/home_screen.dart';
import '../ForgetPasswordScreen/forget_password_screen.dart';
import '../SignUpScreen/sign_up_screen.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  final auth = FirebaseAuth.instance;

  Future<void> login() async {
    auth.signInWithEmailAndPassword(
        email: _email.text, password: _password.text);
  }

  @override
  void dispose() {
    _email.clear();
    _password.clear();
    super.dispose();
  }

  bool isEmailCorrect = false;
  final _formKey = GlobalKey<FormState>();

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
                      // _formKey!.currentState!.validate() ? 200 : 600,
                      // height: isEmailCorrect ? 260 : 182,
                      width: MediaQuery.of(context).size.width / 1.1,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: TextFormField(
                                controller: _email,
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
                                  // suffixIcon: IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(Icons.close,
                                  //         color: Colors.purple))
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: _password,
                                  obscuringCharacter: '*',
                                  obscureText: true,
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
                                  validator: (value) {
                                    if (value!.isEmpty && value!.length < 5) {
                                      return 'Enter a valid password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                if (_email.text.isNotEmpty &&
                                    _password.text.length > 6) {
                                  try {
                                    login();
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                      const HomeScreen(),
                                    ));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text(
                                          'Login Successfully',
                                          style: TextStyle(
                                              color: Colors.white),
                                        )));
                                  } on FirebaseAuthException catch (e) {
                                    print(e);
                                  }
                                } else {
                                  debugPrint(
                                      'Email is empty or password is empty');
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 20),
                                padding: const EdgeInsets.all(18),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.green,
                                ),
                                child: const Text(
                                  'Log In',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Or login using',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            builder: (context) => const ForgetPasswordScreen(),
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
//                                 builder: (context) => const SignUpScreen(),
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
    );
  }
}
