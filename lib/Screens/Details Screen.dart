import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/Screens/Cart%20Screen.dart';
import 'package:fashion_app/Shared%20Data/Shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
  String title;
  String category;
  String price;
  String image;
  String description;
  DetailsScreen(
      {required this.title,
      required this.category,
      required this.price,
      required this.image,
      required this.description});
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<String> sizes = ["S", "M", "L", "XL"];
  List<String> images = [
    "https://cdn.shopify.com/s/files/1/0981/8178/files/pattern-on-top-outfit-navy-pindot-shirt.jpg?5781743328389535709",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
  ];
  int currentIndex = 0;
  int imageIndex = 0;
  int counter = 0;
  bool isLoved = false;
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
            'Details',
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
                        Navigator.pop(context);
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
                    Icons.share_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ClipPath(
                            clipper: BigNotch(),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height / 3,
                                width: double.infinity,
                                child: CachedNetworkImage(imageUrl:
                                    images[imageIndex],
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const SpinKitFadingCircle( // Choose any effect from the package
                                    color: Color(0xffFF660E),
                                    size: 50.0,
                                  ),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: MediaQuery.sizeOf(context).width *
                              0.15, // Adjust left margin
                          right: MediaQuery.sizeOf(context).width *
                              0.15, // Adjust right margin
                          child: Container(
                            height: MediaQuery.sizeOf(context).height /
                                12, // Reduce height
                            decoration: BoxDecoration(
                              color: const Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(20),
                              // Rounded corners
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Center(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: images.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imageIndex = index;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: imageIndex == index
                                                ? Colors.orange
                                                : Colors.transparent,
                                            width: 3,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(imageUrl:
                                              images[index],
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) => const SpinKitFadingCircle( // Choose any effect from the package
                                              color: Color(0xffFF660E),
                                              size: 50.0,
                                            ),
                                            errorWidget: (context, url, error) => const Icon(Icons.error),
                                          )
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(-6, 7),
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isLoved = !isLoved;
                            });
                          },
                          icon: Icon(
                            size: 30,
                            isLoved ? Icons.favorite : Icons.favorite_border,
                            color: isLoved ? Colors.red : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                          widget.category,
                          style: GoogleFonts.urbanist(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "\$${widget.price}",
                    style: GoogleFonts.urbanist(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Select Size",
                style: GoogleFonts.urbanist(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Horizontal ListView for sizes
                  Expanded(
                    child: SizedBox(
                      height: 45,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? const Color(0xffFF660E)
                                      : const Color(0xffF5F5F5),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  sizes[index],
                                  style: GoogleFonts.urbanist(
                                    fontSize: 20,
                                    color: currentIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Spacer to add space between the ListView and the counter
                  const SizedBox(width: 10), // Adjust spacing as needed
                  // Counter widget
                  Container(
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xffF5F5F5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFFFFF),
                            ),
                            margin: const EdgeInsets.only(left: 2, right: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (counter == 0) return;
                                  counter--;
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                          ),
                          Text(
                            "$counter",
                            style: GoogleFonts.urbanist(
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffFFFFFF),
                            ),
                            margin: const EdgeInsets.only(right: 2, left: 10),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  counter++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Description",
                style: GoogleFonts.urbanist(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.description,
                style: GoogleFonts.urbanist(
                    fontSize: 18,
                    color: Colors.black.withOpacity(0.5),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton(
                  onPressed: () {
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFFFFFF),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add_box_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        Spacer(),
                        Text(
                          "Add to Cart",
                          style: GoogleFonts.urbanist(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffFF660E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                       const Spacer(),
                        Text(
                          "Buy Now",
                          style: GoogleFonts.urbanist(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
