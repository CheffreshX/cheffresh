import 'package:cheffresh/core/view_models/orders/orders_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:cheffresh/ui/widgets/map_with_marker.dart';
import 'package:cheffresh/ui/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class DummyOrder {
  DateTime DateCreated;

  //Food
  String DishName, Details, DishCategory;
  List<String> FoodImages;
  List<String> Tags;
  double Price;

  //Food Provider
  String FoodProviderName, Phone, Address, FoodProviderImage;
  double FoodProviderRating;
  double Lat, Lng;

  DummyOrder({
    DateTime DateCreated,
    String DishName,
    String Details,
    List<String> FoodImages,
    String FoodProviderImage,
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
    this.FoodImages = FoodImages;
    this.FoodProviderImage = FoodProviderImage;
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
    DateCreated: DateTime.parse('2020-06-29 20:18:04Z'),
    DishName: 'Fish n\' Chips',
    Details:
        'I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!',
    FoodImages: [
      'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/meelan-bawjee-A_tPBct4tz8-unsplash.jpg?alt=media&token=609a9559-fe8e-44ae-84e6-530b1d7557eb'
    ],
    FoodProviderImage:
        'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f',
    Tags: ['Vegan', 'Nut-free'],
    DishCategory: 'Fish n\' Chips',
    Price: 40.0,
    FoodProviderName: 'Louis Henson',
    FoodProviderRating: 4.5,
    Phone: '34314233253',
    Address: '1 Hogwarts Street',
    Lat: 34.3,
    Lng: 23.4,
  ),
  DummyOrder(
    DateCreated: DateTime.parse('1969-07-20 20:18:04Z'),
    DishName: 'Fish n\' Chips',
    Details:
        'I used fake fish made of soy to preserve the fish in the atlantic ocean. The chips are made of taste-the-difference potatoes from my local Sainsbury’s on the same day. This should keep those fish cravings for those new vegans :). Don’t have these everyday!',
    FoodImages: [
      'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/meelan-bawjee-A_tPBct4tz8-unsplash.jpg?alt=media&token=609a9559-fe8e-44ae-84e6-530b1d7557eb'
    ],
    FoodProviderImage:
    'https://firebasestorage.googleapis.com/v0/b/cheffresh-2020.appspot.com/o/louis-hansel-shotsoflouis-v3OlBE6-fhU-unsplash.jpg?alt=media&token=75a165e6-7727-489c-aa57-f259e9b5436f',
    Tags: ['Vegan', 'Nut-free'],
    DishCategory: 'Fish n\' Chips',
    Price: 40.0,
    FoodProviderName: 'Louis Henson',
    FoodProviderRating: 4.5,
    Phone: '34314233253',
    Address: '1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street1 Hogwarts Street',
    Lat: 34.3,
    Lng: 23.4,
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

  bool hasBeenCollected(DateTime dateCollected) =>
      !DateTime
          .now()
          .difference(dateCollected)
          .isNegative;

  @override
  Widget build(BuildContext context) {
    return Card(
        color: PRIMARY_COLOR,
        borderOnForeground: true,
        elevation: 1.0,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    FoodVisual(widget: widget),
                    FoodProviderVisualWidget(widget: widget),
                    if (widget.order.Tags?.isNotEmpty)
                      BuildTags(widget: widget),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setWidth(5),
                  ),
                  child: Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(widget.order.DishName),
                              if (hasBeenCollected(widget.order.DateCreated))
                                Pill(
                                  '',
                                  color: ALERT_COLOR,
                                  widget: Row(
                                    children: <Widget>[
                                      Text('Add Review '),
                                      Icon(
                                        Icons.rate_review,
                                        size: ScreenUtil().setWidth(15),
                                      )
                                    ],
                                  ),
                                )
                              else
                                InkWell(
                                  onTap: _callNumber,
                                  child: Pill(
                                    '',
                                    color: ALERT_COLOR,
                                    widget: Row(
                                      children: <Widget>[
                                        Text('Call '),
                                        Icon(
                                          Icons.call,
                                          size: ScreenUtil().setWidth(15),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Text(
                              'Collected ${getDateCollected(widget.order
                                  .DateCreated)} for £' +
                                  widget.order.Price.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
                if (_isExpanded)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(widget.order.Details),
                        Text(
                          'Address: ' + widget.order.Address, softWrap: true,),
                        MapWithMarker(
                            location:
                            LatLng(34.3, 23.4)),
                      ],
                    ),
                  ),
                InkWell(
                  onTap: () => _openCart(),
                  child: Center(
                    child: _isExpanded
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  void _openCart() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  String getDateCollected(DateTime orderDate) {
    final now = DateTime.now();
    var time = '';
    if (now
        .difference(orderDate)
        .inDays < 1) {
      time = 'today at ${orderDate.hour}:${orderDate.minute}';
    } else if (now
        .difference(orderDate)
        .inDays < 2) {
      time = 'yesterday at ${orderDate.hour}:${orderDate.minute}';
    } else {
      time = 'on ${orderDate.day}/${orderDate.month}/${orderDate.year}';
    }
    return time;
  }

  void _callNumber() async {
    await FlutterPhoneDirectCaller.callNumber(widget.order.Phone);
  }
}

class FoodVisual extends StatelessWidget {
  const FoodVisual({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final OrderCard widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
      child: Image.network(
        widget.order.FoodImages[0],
        height: ScreenUtil.screenHeightDp / 5,
        width: double.maxFinite,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class BuildTags extends StatelessWidget {
  const BuildTags({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final OrderCard widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.0, top: 5.0),
      child: Container(
        width: ScreenUtil.screenWidthDp / 2,
        child: Row(
          children: <Widget>[
            Pill(
              widget.order.Tags[0],
              color: CONTRAST_COLOR,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            if (widget.order.Tags.length > 1)
              Pill(widget.order.Tags[1], color: PLACEHOLDER_COLOR),
          ],
        ),
      ),
    );
  }
}

class FoodProviderVisualWidget extends StatelessWidget {
  const FoodProviderVisualWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final OrderCard widget;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil.screenHeightDp / 10,
            height: ScreenUtil.screenHeightDp / 10,
            decoration: BoxDecoration(
              border: Border.all(
                  width: ScreenUtil().setWidth(3), color: CONTRAST_COLOR),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.order.FoodProviderImage),
              ),
            ),
          ),
          SmoothStarRating(
              allowHalfRating: true,
              starCount: 5,
              rating: widget.order.FoodProviderRating,
              size: ScreenUtil().setWidth(15),
              isReadOnly: true,
              color: ALERT_COLOR,
              spacing: 0.0),
        ],
      ),
    );
  }
}
