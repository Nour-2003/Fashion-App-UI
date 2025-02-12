import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Shared Data/Shared.dart';

class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  int currentIndex = 0;

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        centerTitle: true,
        title: FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: Text('My WishList',style: GoogleFonts.urbanist(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold
          ),),
        ),
      ),
      body:
         SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.78,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: GoogleFonts.urbanist(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color(0xffF5F5F5),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.sliders,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.74,
                    ),
                    itemCount: fashionData['items'].length,
                    itemBuilder: (context, index) {
                      return gridItem(
                        fashionData['items'][index],
                        true,
                        context
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
