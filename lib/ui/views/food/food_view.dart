import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/services/firestore_functions.dart';
import 'package:cheffresh/ui/widgets/map_with_marker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
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

// ignore: must_be_immutable
class FoodView extends StatelessWidget {
  FoodView({
    Key key,
  }) : super(key: key);

  List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    final firestoreProvider = Provider.of<FirestoreFunctions>(context);

    return StreamBuilder(
        stream: firestoreProvider.fetchReservationsAsStream(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            reservations = snapshot.data.documents
                .map((doc) => Reservation.fromMap(doc.data, doc.documentID))
                .toList();
            return PageView.builder(
              itemCount: reservations.length,
              itemBuilder: (buildContext, index) =>
                  FoodCard(reservations[index]),
            );
          } else {
            return Text('fetching');
          }
        });
  }
}

// ignore: must_be_immutable
class FoodCard extends StatefulWidget {
  FoodCard(Reservation reservation, {
    Key key,
  })
      : reservation = reservation,
        super(key: key);

  Reservation reservation;

  @override
  _FoodCardState createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
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
                    'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/meelan-bawjee-A_tPBct4tz8-unsplash.jpg?alt=media&token=609a9559-fe8e-44ae-84e6-530b1d7557eb'),
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
                        'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f'),
                  ),
                ),
              ),
              Container(
                transform: Matrix4.translationValues(0, -64, 0),
                child: Column(
                  children: [
                    Text(
                      widget.reservation.mealName ?? '', //Fish n' Chips",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF4A5568),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'by Louis Henson',
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
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 16),
                          Pill(
                            '4/10 available',
                            textColor: Color(0xFF38A169),
                            color: Color(0xFFC6F6D5),
                          ),
                          SizedBox(width: 10),
                          Pill('Vegan'),
                          SizedBox(width: 10),
                          Pill('Nut-free'),
                          SizedBox(width: 10),
                          Pill('Junk'),
                          SizedBox(width: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                          'I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!',
                          style: TextStyle(
                            color: Color(0xFF4A5568),
                          )),
                    ),
                    SizedBox(height: 24),
                    MapWithMarker(
                        location: LatLng(37.42796133580664, -122.085749655962)),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Reviews(),
                    ),
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


class Reviews extends StatelessWidget {
  final double score = 4.5;
  final String author = 'Dart Vader';
  //  final String description;
  final description =
      'This satisfied my cravings for fish without causing hard to the environment. Thank you Louis. I will be back. I didn\'t like the seagulls though!';

  const Reviews({
    Key key,
    // @required this.score,
    // @required this.author,
    // @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var reviews = [
      Review(score: score, author: author, description: description),
      SizedBox(height: 8),
      Review(score: score, author: author, description: description),
      SizedBox(height: 8),
      Review(score: score, author: author, description: description),
    ];

    return Column(
      children: [
        ...reviews.map((review) {
          return review;
        }),
        SizedBox(
          height: 24,
        )
      ],
    );
  }
}

class Review extends StatelessWidget {
  const Review({
    Key key,
    @required this.score,
    @required this.author,
    @required this.description,
  }) : super(key: key);

  final double score;
  final String author;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothStarRating(
                allowHalfRating: true,
                onRated: (v) {},
                starCount: 5,
                rating: score,
                size: 16.0,
                isReadOnly: true,
                color: Color(0xFF4A5568),
                spacing: 0.0),
            Text(author,
                style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic))
          ],
        ),
        Text(
          description,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class Pill extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  Pill(this.text, {
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
