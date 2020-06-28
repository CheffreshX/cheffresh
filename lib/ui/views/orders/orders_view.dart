import 'package:cheffresh/core/view_models/orders/orders_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DummyOrder {
  DateTime DateCreated;

  //Food
  String DishName, Details, DishCategory;
  NetworkImage FoodPictures;
  List<String> Tags;
  double Price;

  //Food Provider
  String FoodProviderName, Phone, Address;
  double FoodProviderRating;
  double Lat, Lng;

  DummyOrder({
    DateTime DateCreated,
    String DishName,
    String Details,
    NetworkImage FoodPictures,
    List<String> Tags,
    String DishCategory,
    double Price,
    String FoodProviderName,
    double FoodProviderRating,
    String Phone,
    String Address,
    double Lat,
    double Lng,
  }) {
    this.DateCreated = DateCreated;
    this.DishName = DishName;
    this.Details = Details;
    this.FoodPictures = FoodPictures;
    this.Tags = Tags;
    this.DishCategory = DishCategory;
    this.Price = Price;
    this.FoodProviderName = FoodProviderName;
    this.FoodProviderRating = FoodProviderRating;
    this.Phone = Phone;
    this.Address = Address;
    this.Lat = Lat;
    this.Lng = Lng;
  }
}

List<DummyOrder> ORDERS = [
  DummyOrder(
    DateCreated: DateTime.parse('1969-07-20 20:18:04Z'),
    DishName: 'Fish n\' Chips',
    Details:
        'I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!',
    FoodPictures: NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f'),
    Tags: ['Vegan', 'Nut-free'],
    DishCategory: 'Fish n\' Chips',
    Price: 40.0,
    FoodProviderName: 'Louis Henson',
    FoodProviderRating: 4.5,
    Phone: '34314233253',
    Address: '1 Hogwarts Street',
    Lat: 2.53,
    Lng: 500.3,
  ),
  DummyOrder(
    DateCreated: DateTime.parse('1969-07-20 20:18:04Z'),
    DishName: 'Fish n\' Chips',
    Details:
        'I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!',
    FoodPictures: NetworkImage(
        'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f'),
    Tags: ['Vegan', 'Nut-free'],
    DishCategory: 'Fish n\' Chips',
    Price: 40.0,
    FoodProviderName: 'Louis Henson',
    FoodProviderRating: 4.5,
    Phone: '34314233253',
    Address: '1 Hogwarts Street',
    Lat: 2.53,
    Lng: 500.3,
  ),
];

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OrdersViewModel>(
        model: OrdersViewModel(),
        builder: (BuildContext context, OrdersViewModel model, Widget child) =>
            Scaffold(
              appBar: defaultAppBar(title: 'Orders'),
              body: SafeArea(
                  child: model.busy
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: ORDERS.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderCard(
                              order: ORDERS[index],
                            );
                          },
                        )),
            ));
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final DummyOrder order;

  @override
  _OrderCardState createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: PRIMARY_COLOR,
        elevation: 1.0,
        child: Column(
          children: <Widget>[
            InkWell(
                onTap: () => _openCart(),
                child: Center(
                  child: _isExpanded
                      ? Icon(Icons.keyboard_arrow_down)
                      : Icon(Icons.keyboard_arrow_up),
                )),
            if (_isExpanded) Text('more details'),
          ],
        ));
  }

  void _openCart() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }
}
