import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_app/Screens/Cart%20Screen.dart';
import 'package:fashion_app/Screens/Details%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

List<String> categories = ['All', 'Women', 'Men', 'Girls', 'Babies'];
Map<String, dynamic> popularProducts = {
  "items": [
    {
      "id": "1",
      "name": "Classic White Tee",
      "price": 29.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description": "A timeless classic, perfect for any casual outfit.",
      "category": "Tops",
      "rating": 4.5,
      "sizes": ["S", "M", "L", "XL"],
      "colors": ["White", "Black", "Gray"]
    },
    {
      "id": "2",
      "name": "High-Waist Jeans",
      "price": 59.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description": "Stylish and comfortable high-waist jeans for a modern look.",
      "category": "Bottoms",
      "rating": 4.7,
      "sizes": ["S", "M", "L"],
      "colors": ["Blue", "Black"]
    },
  ]
};
Map<String, dynamic> fashionData = {
  "items": [
    {
      "id": "1",
      "name": "Classic White Tee",
      "price": 29.99,
      "imageUrl":
      "https://cdn.shopify.com/s/files/1/0981/8178/files/pattern-on-top-outfit-navy-pindot-shirt.jpg?5781743328389535709",
      "description": "A timeless classic, perfect for any casual outfit.",
      "category": "Tops",
      "rating": 4.5,
      "sizes": ["S", "M", "L", "XL"],
      "colors": ["White", "Black", "Gray"]
    },
    {
      "id": "2",
      "name": "High-Waist Jeans",
      "price": 59.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "Stylish and comfortable high-waist jeans for a modern look.",
      "category": "Bottoms",
      "rating": 4.7,
      "sizes": ["S", "M", "L"],
      "colors": ["Blue", "Black"]
    },
    {
      "id": "3",
      "name": "Leather Jacket",
      "price": 129.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description": "A sleek leather jacket for a bold and edgy style.",
      "category": "Outerwear",
      "rating": 4.8,
      "sizes": ["M", "L", "XL"],
      "colors": ["Black", "Brown"]
    },
    {
      "id": "4",
      "name": "Running Sneakers",
      "price": 89.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "Lightweight and durable sneakers for your active lifestyle.",
      "category": "Footwear",
      "rating": 4.6,
      "sizes": ["6", "7", "8", "9", "10"],
      "colors": ["White", "Black", "Blue"]
    },
    {
      "id": "5",
      "name": "Elegant Silk Scarf",
      "price": 39.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "A luxurious silk scarf to add a touch of elegance to any outfit.",
      "category": "Accessories",
      "rating": 4.4,
      "colors": ["Red", "Blue", "Green"]
    }
  ]
};
Map<String, dynamic> cart = {
  "items": [
    {
      "id": "1",
      "name": "Classic White Tee",
      "price": 29.99,
      "imageUrl":
      "https://cdn.shopify.com/s/files/1/0981/8178/files/pattern-on-top-outfit-navy-pindot-shirt.jpg?5781743328389535709",
      "description": "A timeless classic, perfect for any casual outfit.",
      "category": "Tops",
      "rating": 4.5,
      "sizes": ["S", "M", "L", "XL"],
      "colors": ["White", "Black", "Gray"]
    },
    {
      "id": "2",
      "name": "High-Waist Jeans",
      "price": 59.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "Stylish and comfortable high-waist jeans for a modern look.",
      "category": "Bottoms",
      "rating": 4.7,
      "sizes": ["S", "M", "L"],
      "colors": ["Blue", "Black"]
    },
    {
      "id": "3",
      "name": "Leather Jacket",
      "price": 129.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description": "A sleek leather jacket for a bold and edgy style.",
      "category": "Outerwear",
      "rating": 4.8,
      "sizes": ["M", "L", "XL"],
      "colors": ["Black", "Brown"]
    },
    {
      "id": "4",
      "name": "Running Sneakers",
      "price": 89.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "Lightweight and durable sneakers for your active lifestyle.",
      "category": "Footwear",
      "rating": 4.6,
      "sizes": ["6", "7", "8", "9", "10"],
      "colors": ["White", "Black", "Blue"]
    },
    {
      "id": "5",
      "name": "Elegant Silk Scarf",
      "price": 39.99,
      "imageUrl":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGE22dkDnZ9ECqcwnV5IRFu2fegF7vo-EfKw&s",
      "description":
      "A luxurious silk scarf to add a touch of elegance to any outfit.",
      "category": "Accessories",
      "rating": 4.4,
      "colors": ["Red", "Blue", "Green"]
    }
  ]
};
List<String> specialOffers = [
  "https://www.shutterstock.com/image-vector/special-offer-3d-editable-vector-260nw-2302370961.jpg",
  "https://www.shutterstock.com/image-vector/special-offer-banner-vector-template-260nw-2474802375.jpg",
  "https://www.shutterstock.com/image-vector/special-offer-3d-editable-vector-260nw-2302370961.jpg",
  "https://www.shutterstock.com/image-vector/special-offer-banner-vector-template-260nw-2474802375.jpg"
];

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchSize = 53.0;
    double cornerRadius = 11.0;

    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width - notchSize - cornerRadius, 0);

    // Top-right notch curve (horizontal)
    path.quadraticBezierTo(
        size.width - notchSize,
        0,
        size.width - notchSize,
        cornerRadius
    );

    path.lineTo(size.width - notchSize, notchSize - cornerRadius);

    path.quadraticBezierTo(
        size.width - notchSize,
        notchSize,
        size.width - notchSize + cornerRadius,
        notchSize
    );

    path.lineTo(size.width, notchSize);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
class BigNotch extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double notchSize = 63.0;
    double cornerRadius = 15.0;
    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width - notchSize - cornerRadius, 0);

    path.quadraticBezierTo(
        size.width - notchSize,
        0,
        size.width - notchSize,
        cornerRadius
    );

    path.lineTo(size.width - notchSize, notchSize - cornerRadius);

    path.quadraticBezierTo(
        size.width - notchSize,
        notchSize,
        size.width - notchSize + cornerRadius,
        notchSize
    );

    path.lineTo(size.width, notchSize);

    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
Widget gridItem(product,bool isFav,context)
{
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder:
      (context) => DetailsScreen(
        title: product['name'],
        image: product['imageUrl'],
        price: product['price'].toString(),
        description: product['description'],
        category: product['category'],
      )
      ));
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF5F5F5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: ClipPath(
                      clipper: NotchClipper(),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          height: 180, // Set a fixed height for all images
                          width: double.infinity, // Optional, allows the image to fill the width
                          child: CachedNetworkImage(
                            placeholder: (context, url) => const SpinKitFadingCircle( // Choose any effect from the package
                              color: Color(0xffFF660E),
                              size: 50.0,
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                            imageUrl:
                              product['imageUrl'],
                              fit: BoxFit.cover, // Ensures the image fills the height and width, cropping if necessary

                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.translate(
                    offset: const Offset(-6,7),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon:Icon(
                          isFav ? Icons.favorite:Icons.favorite_border,
                          color: isFav ? Colors.red:Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: GoogleFonts.urbanist(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '\$${product['price']}',
                        style: GoogleFonts.urbanist(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xffFF660E),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
                      },
                      icon: const Icon(
                        size: 28,
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}