import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastel/feactures/app/constants.dart';
import 'package:pastel/feactures/auth/models/Product.dart';

import 'components/add_to_cart.dart';
import 'components/color_and_size.dart';
import 'components/counter_with_fav_btn.dart';
import 'components/description.dart';
import 'components/product_title_with_image.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: yellowPastel,
      appBar: AppBar(
        backgroundColor: yellowPastel,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left),
          // SvgPicture.asset(
          //   'assets/icons/back.svg',
          //   colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.search),
            // SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          if (FirebaseAuth.instance.currentUser != null)
            IconButton(
              icon: Icon(CupertinoIcons.cart),
              // SvgPicture.asset("assets/icons/search.svg"),
              onPressed: () {
                Navigator.pushNamed(context, 'cartStore');
              },
            ),
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        Description(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        AddToCart(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        CounterWithFavBtn(),
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}