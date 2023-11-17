import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../components/custom_button.dart';
import '../../components/custom_textfield.dart';
import '../../utils/config.dart';
import '../HomeScreen/home_screen.dart';


class FarmDetailScreen extends StatefulWidget {
  const FarmDetailScreen({super.key});

  @override
  State<FarmDetailScreen> createState() => _FarmDetailScreenState();
}

class _FarmDetailScreenState extends State<FarmDetailScreen> {
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
            image: DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx7IBkCtYd6ulSfLfDL-aSF3rv6UfmWYxbSE823q36sPiQNVFFLatTFdGeUSnmJ4tUzlo&usqp=CAU'),
                fit: BoxFit.cover,
                opacity: 0.3)),
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 240,
                          width: 230,
                        ),
                        Positioned(
                          top: 180,
                          left: 24,
                          child: Text(
                            AppConfig.farmingDetailsText,
                            style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff0D5E06)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  customTextField(
                    textLevel: 'Enter Your Crop Type',
                    context: context,
                    textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(

                    textLevel: 'Enter Your Soil Type',
                    context: context,
                      textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(
                    textLevel: 'Enter Your Climate',
                    context: context,
                      textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(

                    textLevel: 'Farm Size and layout',
                    context: context,
                      textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(

                    textLevel: 'Pest and disease',
                    context: context,
                      textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(

                    textLevel: 'Farming equipment',
                    context: context,
                      textColor:  Colors.green
                  ),
                  const SizedBox(height: 6,),
                  customTextField(

                    textLevel: 'Economic Information',
                    context: context,
                      textColor:  Colors.green
                  ),

                  InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          )),
                      child: customButton(
                        label: 'SUBMIT',
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
