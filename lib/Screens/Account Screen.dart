import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: Text(
            'Account',
            style: GoogleFonts.urbanist(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: FadeInLeft(
          duration: const Duration(milliseconds: 500),
          child: SizedBox(
            width: double.infinity, // Take up full available width
            child: Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  // Add other widgets here
                ],
              ),
            ),
          ),
        ),
        actions: [
          FadeInRight(
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(right: 18), // Adjust spacing
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffF5F5F5),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffF5F5F5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const SpinKitFadingCircle( // Choose any effect from the package
                              color: Color(0xffFF660E),
                              size: 50.0,
                            ),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                            imageUrl:
                            'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nour Eldin',
                                style: GoogleFonts.urbanist(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'noueldean@gmail.com',
                                style: GoogleFonts.urbanist(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ]),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.edit,
                            size: 27,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Settings",
                  style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                accountItem(FontAwesomeIcons.person, 'Account Details'),
                const SizedBox(height: 15),
                accountItem(Icons.notifications, 'Notifications'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.bell, 'Email'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.location, 'Location'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.signOut, 'Log Out'),
                const SizedBox(height: 20),
                Text(
                  "Support",
                  style: GoogleFonts.urbanist(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                accountItem(FontAwesomeIcons.question, 'FAQ'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.headset, 'Contact Us'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.star, 'Rate Us'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.share, 'Share'),
                const SizedBox(height: 15),
                accountItem(FontAwesomeIcons.info, 'About Us'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget accountItem(IconData icon, String title) {
  return  Container(
    width: double.infinity,
    height: 70,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: const Color(0xffF5F5F5),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color(0xffFFFFFF),
              ),
              child:  FaIcon(
                icon,
                size: 20,
              )),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.urbanist(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    ),
  );
}