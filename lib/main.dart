import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/movie_screen.dart';
import 'package:flutter_application_1/splash_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // animasi splash screen
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.black87,
                      Colors.grey.shade800,
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              // google fonts
              title: Text(
                'Home',
                style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            endDrawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: const Text(
                      'Yusril Malik',
                      style:
                          TextStyle(color: Color.fromARGB(255, 214, 214, 206)),
                    ),
                    accountEmail: const Text('yusrilgaming710@gmail.com',
                        style: TextStyle(
                            color: Color.fromARGB(255, 220, 215, 215))),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipOval(
                        child: Image.asset(
                          fit: BoxFit.cover,
                          'assets/dragon green.jpeg',
                          width: 90,
                        ),
                      ),
                    ),
                    decoration: const BoxDecoration(
                        color: Colors.cyan,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://th.bing.com/th/id/OIP.1k2_wVuWM-a-pN34Td1wTAHaEo?w=289&h=181&c=7&r=0&o=5&dpr=1.5&pid=1.7'))),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.movie_creation_outlined),
                    title: const Text('Movies'),
                    onTap: () {
                      // page transition
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.scale,
                            alignment: Alignment.bottomCenter,
                            childCurrent: this,
                            duration: const Duration(milliseconds: 400),
                            // reverseDuration: const Duration(milliseconds: 400),
                            child: const MangaScreen(),
                          ));
                    },
                  ),
                  ListTile(
                    // font awesome icon
                    leading: const Icon(FontAwesomeIcons.whatsapp),
                    title: const Text('WhatsApp'),
                    onTap: () async {
                      final Uri url =
                          Uri.parse('https://wa.me/6282248535718?text=Hello');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  ListTile(
                    // font awesome icon
                    leading: const Icon(FontAwesomeIcons.facebook),
                    title: const Text('facebook'),
                    onTap: () async {
                      final Uri url = Uri.parse(
                          'https://www.facebook.com/profile.php?id=61565828571559&mibextid=ZbWKwL');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url,
                            mode: LaunchMode.externalApplication);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Logout'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: const Text('Logout'),
                            content:
                                const Text('Apakah anda yakin ingin keluar?'),
                            actions: [
                              TextButton(
                                  child: const Text('Batal'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  }),
                              TextButton(
                                  child: const Text(
                                    'Keluar',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  onPressed: () {
                                    SystemNavigator.pop();
                                  }),
                            ]),
                      );
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      // animated logo
                      const AnimatedLogo(),
                      const SizedBox(height: 25),

                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Yusril Malik',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFF1A237E),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              decoration: BoxDecoration(
                                color: Color(0xFF1A237E),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Mobile Application Engineer',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            AnimatedTextKit(
                              animatedTexts: [
                                TyperAnimatedText(
                                  "Flutter Developer that loves to learn new things. I'm currently working as a Flutter Developer at Kompas Gramedia.",
                                  speed: const Duration(milliseconds: 60),
                                  textStyle: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                              totalRepeatCount: 1,
                              displayFullTextOnTap: true,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),

                      // Social Links
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildSocialButton(
                            icon: FontAwesomeIcons.github,
                            color: Colors.black,
                            onTap: () async {
                              final Uri url = Uri.parse('');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                          _buildSocialButton(
                            icon: FontAwesomeIcons.facebook,
                            color: Color(0xFF0077B5),
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  'https://www.facebook.com/profile.php?id=61565828571559&mibextid=ZbWKwL');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                          _buildSocialButton(
                            icon: FontAwesomeIcons.whatsapp,
                            color: Color(0xFF1DA1F2),
                            onTap: () async {
                              final Uri url = Uri.parse(
                                  'https://wa.me/6282248535718?text=Hello');
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url,
                                    mode: LaunchMode.externalApplication);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}

// animated logo new class
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({super.key});

  @override
  State<AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> {
  bool isZoomed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.only(bottom: isZoomed ? 50.0 : 0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isZoomed = !isZoomed;
          });
        },
        child: AnimatedScale(
          scale: isZoomed ? 1.3 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              // Menambahkan border tipis agar terlihat lebih bagus
              border: Border.all(
                color: Colors.pink,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isZoomed ? 20 : 75),
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/dragon green.jpeg',
                width: 150,
                height: 150, // Menambahkan height agar gambar tetap persegi
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialButton({
  required IconData icon,
  required Color color,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 153, 21, 21).withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: 24,
        ),
      ),
    ),
  );
}
