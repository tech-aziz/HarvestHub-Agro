// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:harvest_hub_agro/views/SignUpScreen/sign_up_screen.dart';
//
// import '../../utils/config.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 20),
//                       child: Image.asset(
//                         'assets/images/logo.png',
//                         height: 225,
//                         width: 250,
//                       ),
//                     ),
//                     Container(
//                       width: 312,
//                       height: 422,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(39),
//                           image: const DecorationImage(
//                               image: AssetImage(
//                             'assets/images/login_image.png',
//                           ))),
//                       child: Column(
//                         children: [
//                           const SizedBox(
//                             height: 5,
//                           ),
//                           Image.asset(
//                             'assets/images/person.png',
//                             width: 129,
//                             height: 150,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 30),
//                             child: Column(
//                               children: [
//                                 TextFormField(
//                                   keyboardType: TextInputType.emailAddress,
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.person,
//                                       color: Colors.white,
//                                     ),
//                                     hintText: 'Enter Your e-mail',
//                                     hintStyle: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 TextFormField(
//                                   keyboardType: TextInputType.visiblePassword,
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(
//                                       Icons.lock,
//                                       color: Colors.white,
//                                     ),
//                                     hintText: 'Password',
//                                     hintStyle: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 Align(
//                                   alignment: Alignment.centerRight,
//                                   child: Text(
//                                     AppConfig.forgetPasswordText,
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 12,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 Text(AppConfig.orSignInUsingText,
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 11,
//                                       color: Colors.white,
//                                     )),
//                                 const SizedBox(
//                                   height: 30,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset('assets/icons/facebook.png'),
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     Image.asset('assets/icons/google.png'),
//                                     const SizedBox(
//                                       width: 15,
//                                     ),
//                                     Image.asset('assets/icons/twitter.png')
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 45, right: 45),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Container(
//                               height: 49,
//                               width: 231,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(50),
//                                   color: const Color(0xff16FC02)),
//                               child: Center(
//                                 child: Text(
//                                   AppConfig.loginText,
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(
//                             width: 12,
//                           ),
//                           Expanded(
//                             child: InkWell(
//                               onTap: () =>
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => const SignUpScreen(),
//                               )),
//                               child: Container(
//                                 height: 49,
//                                 width: 231,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(50),
//                                     color: const Color(0xff16FC02)),
//                                 child: Center(
//                                   child: Text(
//                                     AppConfig.signUpText,
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 24,
//                                         fontWeight: FontWeight.w700),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 45),
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: ClipPath(
//                       clipper: CustomContainers(),
//                       child: Container(
//                         width: 117,
//                         height: 38,
//                         decoration: BoxDecoration(
//                             color: const Color(0xff31F920),
//                             borderRadius: BorderRadius.circular(50)),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text(
//                                 AppConfig.langText,
//                                 style: GoogleFonts.poppins(fontSize: 23),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(bottom: 14),
//                                 child: Image.asset('assets/icons/arrow_up.png'),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomContainers extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // TODO: implement getClip
//     var path = Path();
//     path.lineTo(0, 48);
//     path.lineTo(size.width, 13);
//     path.lineTo(size.width, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) => true;
// }
