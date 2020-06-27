import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

// class Meal {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final List<String> tags;
//   final int quantityTotal;
//   final int quantityRemaining;
//   final int priceInCents;
//   final String collectionTimestamp;
//   final String authorName;
//   final String authorStars;
//   final String authorPhone;
//   final Image authorImage;

//   Meal(
//     this.title,
//     this.description,
//     this.imageUrl,
//     this.tags,
//     this.quantityTotal,
//     this.quantityRemaining,
//     this.priceInCents,
//     this.collectionTimestamp,
//     this.authorName,
//     this.authorStars,
//     this.authorPhone,
//     this.authorImage,
//   );
// }

// List<Meal> mockData = [
//   Meal(
//     "Fish and chips",
//     "I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!",
//     "",
//   )
// ];

class FoodView extends StatelessWidget {
  const FoodView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(children: [FoodCard(), FoodCard()]);
  }
}

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          // color: Color(0xFFF7FAFC),
          decoration: BoxDecoration(
            color: Color(0xFFF7FAFC),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Image.network(
                    "https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/meelan-bawjee-A_tPBct4tz8-unsplash.jpg?alt=media&token=609a9559-fe8e-44ae-84e6-530b1d7557eb"),
              ),
              Container(
                transform: Matrix4.translationValues(0, -64, 0),
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  border: Border.all(width: 4, color: Color(0xFFF7FAFC)),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                transform: Matrix4.translationValues(0, -64, 0),
                child: Column(
                  children: [
                    Text(
                      "Fish n' Chips",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4A5568),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "by Louis Henson",
                      style: TextStyle(
                        color: Color(0xFF4A5568),
                      ),
                    ),
                    SmoothStarRating(
                        allowHalfRating: true,
                        onRated: (v) {},
                        starCount: 5,
                        rating: 4.5,
                        size: 24.0,
                        isReadOnly: true,
                        color: Color(0xFF4A5568),
                        spacing: 0.0),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Pill(
                          "4/10 available",
                          textColor: Color(0xFF38A169),
                          color: Color(0xFFC6F6D5),
                        ),
                        SizedBox(width: 10),
                        Pill('Vegan'),
                        SizedBox(width: 10),
                        Pill('Nut-free')
                      ],
                    ),
                    SizedBox(height: 24),
                    Text(
                        "I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!",
                        style: TextStyle(
                          color: Color(0xFF4A5568),
                        )),
                    SizedBox(height: 24),
                    Text("add Map here"),
                    SizedBox(height: 24),
                    Text("add reviews here"),
                    SizedBox(
                      height: 64,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  Pill(
    this.text, {
    Key key,
    this.color = const Color(0xFFE2E8F0),
    this.textColor = const Color(0xFF4A5568),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        // color: Color(0xFFE2E8F0), <-- enable this causes overflow error.
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        // ,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ));
  }
}
