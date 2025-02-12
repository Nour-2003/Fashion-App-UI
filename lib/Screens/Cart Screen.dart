import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/Shared%20Data/Shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        leadingWidth: 100,
        backgroundColor: const Color(0xffF5F5F5),
        centerTitle: true,
        title: FadeInDown(
          duration: const Duration(milliseconds: 500),
          child: Text(
            'My Cart',
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
                      color: const Color(0xffFFFFFF),
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
                  color: const Color(0xffFFFFFF),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
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
          padding: const EdgeInsets.all(13.0),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: cart['items'].length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(cart['items'][index]['name']),
                onDismissed: (direction) {
                  setState(() {
                    cart['items'].removeAt(index);
                  });
                },
                background: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.red,
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 155,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 110,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    cart['items'][index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cart['items'][index]['name'],
                                  style: GoogleFonts.urbanist(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'Size: L',
                                  style: GoogleFonts.urbanist(
                                    color: Colors.black.withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      '\$${cart['items'][index]['price']}',
                                      style: GoogleFonts.urbanist(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 12.0, right: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: const Color(0xffF5F5F5),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: const Color(
                                                          0xffFFFFFF),
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        left: 2, right: 10),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          if (counter == 0)
                                                            return;
                                                          counter--;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                          Icons.remove),
                                                    ),
                                                  ),
                                                  Text(
                                                    "$counter",
                                                    style:
                                                        GoogleFonts.urbanist(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: const Color(
                                                          0xffFF660E),
                                                    ),
                                                    margin: const EdgeInsets.only(
                                                        right: 2, left: 10),
                                                    child: IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          counter++;
                                                        });
                                                      },
                                                      icon: const Icon(
                                                        Icons.add,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: FadeInUp(
        duration: const Duration(milliseconds: 600),
        child: Container(
          height: MediaQuery.sizeOf(context).height / 2.8,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Enter Discount Code',
                    hintStyle: GoogleFonts.urbanist(
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 17,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffFFFFFF)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        child: Text(
                          'Apply',
                          style: GoogleFonts.urbanist(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: const Color(0xffF5F5F5),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Sub total: ",
                      style: GoogleFonts.urbanist(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 20,
                          ),
                    ),
                    const Spacer(),
                    Text(
                        '\$${cart['items'].fold(0, (previousValue, element) => previousValue + element['price']).toStringAsFixed(2)}',
                        style: GoogleFonts.urbanist(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text("Discount: ",
                        style: GoogleFonts.urbanist(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 20,
                        )),
                    Spacer(),
                    Text(
                      "\$0",
                      style: GoogleFonts.urbanist(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Divider(
                  color: Colors.black.withOpacity(0.3),
                  thickness: 1,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Total: ',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.urbanist(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 20,

                      ),
                    ),
                    const Spacer(),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      '\$${cart['items'].fold(0, (previousValue, element) => previousValue + element['price']).toStringAsFixed(2)}',
                      style: GoogleFonts.urbanist(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFF660E),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FadeInLeft(
                        duration: const Duration(milliseconds: 600),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xffFFFFFF),
                            ),
                            width: 50,
                            height: 50,
                            child: const FaIcon(
                              FontAwesomeIcons.angleDoubleRight,
                              size: 23,
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Checkout',
                            style: GoogleFonts.urbanist(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
