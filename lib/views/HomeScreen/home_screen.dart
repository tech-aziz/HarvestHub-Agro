import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../components/custom_searchbar.dart';
import '../Auth/LoginScreen/login_screen1.dart';
import '../ProductCategoryScreen/product_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List productList = [
    {
      'name': 'Organic Fruits',
      'img': 'assets/images/organic_fruits.jpg',
      'category': [
        {
          'categoryName': 'Fresh Orange',
          'title': 'Benefits and vitamins of freshly squeezed orange',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Navel Orange',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Mandarin Orange',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Clementines Orange',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Fresh Apple',
          'title': 'Apple fruits is awesome',
          'img': "assets/images/apple.png",
          'products': [
            {
              'name': 'Gala Apple',
              'img': 'assets/images/gala.jpg',
              'description':
                  'Gala is an apple cultivar with a sweet, mild flavour, a crisp but not hard texture, and a striped or mottled orange or reddish appearance.'
            },
            {
              'name': 'McIntosh red Apple',
              'img': 'assets/images/gala.jpg.',
              'description':
                  'The McIntosh, McIntosh Red, or colloquially the Mac, is an apple cultivar, the national apple of Canada. The fruit has red and green skin, a tart flavour, and tender white flesh, which ripens in late September.'
            },
            {
              'name': 'Honeycrisp Apple',
              'img': 'assets/images/honeycrisp.jpg',
              'description':
                  'Honeycrisp is an apple cultivar developed at the Minnesota Agricultural Experiment Station Horticultural Research Center at the University of Minnesota, Twin Cities'
            }
          ]
        },
        {
          'categoryName': 'Fresh Banana',
          'title': 'Banana is favorite',
          'img': "assets/images/banana.png",
          'products': [
            {
              'name': 'Cavendish Banana',
              'img': 'assets/images/cavendish_banana.jpg',
              'description':
                  'The Cavendish banana The Cavendish banana is your “typical” banana found at the local grocery store or farmer’s market. They are slightly sweet and have a creamy texture. They have various stages of ripening, from green to yellow, to yellow with brown spots.'
            },
            {
              'name': 'Pisang Raja',
              'img': 'assets/images/pisang.jpg',
              'description':
                  'Pisang Raja bananas Pisang Raja bananas are popular in Indonesia. Featuring a yellow to orange color, they taste like honey-flavored custard with a smooth and creamy consistency. They’re slightly smaller than Cavendish Bananas, averaging four to six inches in length.'
            },
            {
              'name': 'Red Banana',
              'img': 'assets/images/red_banana.jpg',
              'description':
                  'There are over 1,000 different varieties of bananas around the world Red bananas are a subgroup of bananas from Southeast Asia with red skin.They’re soft and have a sweet flavor when ripe. Some people say they taste like a regular banana — but with a hint of raspberry sweetness.They’re often used in desserts but pair well with savory dishes, too.'
            }
          ]
        },
        {
          'categoryName': 'Beautiful Grape',
          'title': 'Heavy nutrition in grape',
          'img': "assets/images/grape.jpg",
          'products': [
            {
              'name': 'Cabernet Sauvignon',
              'img': 'assets/images/cabernet.jpg',
              'description':
                  'It was Bordeaux It was Bordeaux wines that first made this French variety famous. However, Cabernet Sauvignon can now be found worldwide, including in regions like China and Lebanon. This is a rich, full-bodied red wine grape, with an intense flavour and aroma.'
            },
            {
              'name': 'Merlot',
              'img': 'assets/images/merlot.jpg.jpg',
              'description':
                  'Despite being overshadowed by Cabernet Sauvignon, Bordeaux’s “other” variety produces outstanding, aged wines. There is nothing more boisterous or refined than the flavours of cherry fruits in Merlot.'
            },
            {
              'name': 'Airén',
              'img': 'assets/images/airén.jpg',
              'description':
                  'The Airén grape variety is mainly found in the Castilla-La Mancha region of Spain, where vines are planted far apart to cope with the arid climate. It is not a grape in common parlance in the UK but it is estimated to be the third most planted grape in the world'
            }
          ]
        },
        {
          'categoryName': 'Beautiful Grape',
          'title': 'Heavy nutrition in grape',
          'img': "assets/images/grape.jpg",
          'products': [
            {
              'name': 'Cabernet Sauvignon',
              'img': 'assets/images/cabernet.jpg',
              'description':
                  'It was Bordeaux It was Bordeaux wines that first made this French variety famous. However, Cabernet Sauvignon can now be found worldwide, including in regions like China and Lebanon. This is a rich, full-bodied red wine grape, with an intense flavour and aroma.'
            },
            {
              'name': 'Merlot',
              'img': 'assets/images/merlot.jpg.jpg',
              'description':
                  'Despite being overshadowed by Cabernet Sauvignon, Bordeaux’s “other” variety produces outstanding, aged wines. There is nothing more boisterous or refined than the flavours of cherry fruits in Merlot.'
            },
            {
              'name': 'Airén',
              'img': 'assets/images/airén.jpg',
              'description':
                  'The Airén grape variety is mainly found in the Castilla-La Mancha region of Spain, where vines are planted far apart to cope with the arid climate. It is not a grape in common parlance in the UK but it is estimated to be the third most planted grape in the world'
            }
          ]
        }
      ]
    },
    {
      'name': 'Rice',
      'img': 'assets/images/rice.jpg',
      'category': [
        {
          'categoryName': 'Fresh Rice',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Brown rice',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Basmati Rice',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Jasmine rice',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Fresh Rice',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Brown rice',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Basmati Rice',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Jasmine rice',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Fresh Rice',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Brown rice',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Basmati Rice',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Jasmine rice',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Fresh Rice',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Brown rice',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Basmati Rice',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Jasmine rice',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
      ]
    },
    {
      'name': 'Vegetable',
      'img': 'assets/images/vegetable.jpg',
      'category': [
        {
          'categoryName': 'Fresh Potato',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Cabbage Cabbage',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Tomato',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Brinjal',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Vegetable  1',
          'title': 'We love Vegetable so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Vegetable  2',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Vegetable  3',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Vegetable  4',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Vegetable  5',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Vegetable  6',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Vegetable  7',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Vegetable  8',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Vegetable  9',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Vegetable  10',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Vegetable  11',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Vegetable  12',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
      ]
    },
    {
      'name': 'Water',
      'img': 'assets/images/watter.jpg',
      'category': [
        {
          'categoryName': 'Potable water',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Fresh water',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Salt water',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Brackish water',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Water 1',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Water 2',
              'img': 'assets/images/navel_orange.jpg',
              'description':
                  'Navel oranges are Navel oranges are the most common type of orange that consumers eat. They are recognizable by the small hole at the top of the fruit that resembles a navel.'
            },
            {
              'name': 'Water 3',
              'img': 'assets/images/mandarin_orange.jpg',
              'description':
                  'The Mandarin orange, also known as the mandarin or mandarine (both lower-case), is a small citrus tree (Citrus reticulata) with fruit that looks like other oranges. Mandarin oranges are usually eaten plain or in fruit salads.'
            },
            {
              'name': 'Water 4',
              'img': 'assets/images/clementines.jpg',
              'description':
                  'Clementines differ from other citrus in having lower heat requirement, which means the tolerance to fruit maturity and sensitivity to unfavorable conditions during the flowering and fruit-setting period is higher'
            }
          ]
        },
        {
          'categoryName': 'Water 5',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Distilled water',
              'img': 'assets/images/distiller_water.jpg',
              'description':
                  'Distilled water is Distilled water is composed of H2O molecules, having been purified or cleaned through distillation.'
            },
            {
              'name': 'Soft water',
              'img': 'assets/images/soft_water.jpg',
              'description':
                  'Soft water contains  very small amounts of dissolved salts. It may be defined as water with less than 50 mg per litre of calcium carbonate.'
            },
            {
              'name': 'Hard water',
              'img': 'assets/images/hard_water.jpg',
              'description':
                  'Hard water has a high mineral content, particularly magnesium and calcium salts. It is also known as calcareous water.'
            }
          ]
        },
        {
          'categoryName': 'Raw water',
          'title': 'We need rice everyday so far',
          'img': "assets/images/fresh_orange.jpg",
          'products': [
            {
              'name': 'Raw water',
              'img': 'assets/images/raw_water.jpg',
              'description':
                  'Raw water is water that has not undergone any treatment. It is found in natural sources and reserves, in surface and groundwater bodies.'
            },
            {
              'name': 'Grey water',
              'img': 'assets/images/greywater.jpg',
              'description':
                  'Grey water is Grey water is domestic wastewater. It has less nitrogen and phosphorous than black water, and contains organic and inorganic material, and microorganisms'
            },
            {
              'name': 'Black water',
              'img': 'assets/images/black_water.jpg',
              'description':
                  'Within the different kinds of used water, black waters are those that have been polluted with faeces or urine .'
            }
          ]
        },
      ]
    }
  ];
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5)),
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.green),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "Harvest Hub Agro",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                accountEmail: const Text(
                  "support@hubagro.co",
                  style: TextStyle(color: Colors.green),
                ),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/icons/logo.png'),
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/vegetable.jpg",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                otherAccountsPictures: [],
              ),
              // const DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Colors.red,
              //     image: DecorationImage(
              //       image: AssetImage(
              //         "assets/images/vegetable.jpg",
              //       ),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              //   child: Stack(
              //     children: [
              //       Positioned(
              //         bottom: 8.0,
              //         left: 4.0,
              //         child: Text(
              //           "Harvest Hub Agro",
              //           style: TextStyle(
              //               color: Colors.white,
              //               fontSize: 25,
              //               fontWeight: FontWeight.bold),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              ListTile(
                onTap: () {
                  // Get.offAll(() => const MainScreen());
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ));
                },
                title: const Text(
                  'Home',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text('Privacy Policy',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text('Rate Us',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.star_rate_rounded,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  final Uri params = Uri(
                    scheme: 'mailto',
                    path: 'harvesthub_agro@gmail.com',
                    query: 'HarvestHub Agro Feedback',
                  );
                  final url = params.toString();
                  final urlPath = Uri.parse(url);
                  launchUrl(urlPath);
                },
                title: const Text('Feedback',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.feedback_rounded,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Share.share('com.example.harvest_hub_agro');
                },
                title: const Text('Share with friends',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.share,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                title: const Text('Update',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.update,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () {
                  // const AboutListTile(
                  //   applicationName: 'Happy Wall',
                  //   applicationVersion: '1.0',
                  //   applicationLegalese: 'SoftLeads.com',
                  //   child: Text('About App',
                  //       style: TextStyle(fontWeight: FontWeight.bold)),
                  // );
                  Navigator.pop(context);
                },
                title: const Text('About App',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.info,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () => auth.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const loginScreen(),
                      ),
                      (route) => false);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SplashScreen()));
                }),
                title: const Text('Sign out',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              ListTile(
                onTap: () => exit(0),
                title: const Text('Exit',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                leading: const Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.green,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
              const Spacer(),
              const Divider(
                indent: 20,
                thickness: 0.4,
                endIndent: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Version 1.0',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ))
                ],
              )
            ],
          ),
        ),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            // here the desired height
            child: AppBar(
              iconTheme: const IconThemeData(color: Colors.green, size: 25),
              // backgroundColor: Colors.green,
              automaticallyImplyLeading: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    'Welcome',
                    style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Azizul Hakim',
                    style: GoogleFonts.poppins(
                        color: Colors.black.withOpacity(0.9),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg'),
                  ),
                )
              ],
            )),
        body: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const CustomSearchBar(),
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.7,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 5),
                        itemCount: productList.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ProductCategoryScreen(
                                            name: productList[index]['name'],
                                            category: productList[index]
                                                ['category'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: constraints.maxHeight * 0.84,
                                      width: constraints.maxWidth,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.green),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  productList[index]['img']),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                  ),
                                  Text(
                                    productList[index]["name"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 23,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff0D5E06)),
                                  )
                                ],
                              );
                            },
                          );
                        }),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.green),
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/soil_test.jpg'),
                                fit: BoxFit.cover)),
                        child: Center(
                          child: Text('Soil Test / Session',
                              style: GoogleFonts.poppins(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffffffff))),
                        ),
                      ),
                    )
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
