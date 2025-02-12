import 'package:fashion_app/Screens/Wish%20List%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screens/Account Screen.dart';
import 'Screens/Home Page.dart';
import 'Screens/Shopping Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  List<Widget> pages = [
    MyHomePage(),
    const ShoppingScreen(),
    WishList(),
    AccountScreen(),
  ];
  int currentIndex = 0;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: widget.pages[widget.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: const Color(0xffFFFFFF),
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {
            widget.currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xffFF660E),
        unselectedItemColor: const Color(0xff000000),
        showUnselectedLabels: true,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home,size: 23,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.shoppingBag,size: 23),
            label: 'Shopping',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidHeart,size: 23),
            label: 'Wish List',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.userCircle,size: 23),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
