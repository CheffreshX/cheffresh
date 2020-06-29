import 'package:cheffresh/core/models/reservation/reservation.dart';
import 'package:cheffresh/core/services/firestore_functions.dart';
import 'package:cheffresh/core/view_models/orders/orders_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/shared/loading.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:cheffresh/ui/widgets/map_with_marker.dart';
import 'package:cheffresh/ui/widgets/pill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreProvider = Provider.of<FirestoreFunctions>(context);
    return BaseView<OrdersViewModel>(
      model: OrdersViewModel(),
      onModelReady: (OrdersViewModel model) async {
        await model.onReady(firestoreProvider);
      },
      builder: (BuildContext context, OrdersViewModel model, Widget child) =>
          Scaffold(
              appBar: defaultAppBar(title: 'Orders'),
              body: SafeArea(
                child: model.busy
                    ? LoadingView()
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: firestoreProvider.orders.length,
                        itemBuilder: (BuildContext context, int index) {
                          return OrderCard(
                            order: firestoreProvider.orders[index],
                          );
                        },
                      ),
              )),
    );
  }
}

class OrderCard extends StatefulWidget {
  const OrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final Reservation order;

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
                    if (widget.order.tags?.isNotEmpty)
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
                              Text(widget.order.mealName),
                              if (!hasBeenCollected(
                                  DateTime.parse(widget.order.pickupTime)))
////                                Pill(
////                                  '',
////                                  color: ALERT_COLOR,
////                                  widget: Row(
////                                    children: <Widget>[
////                                      Text('Add Review '),
////                                      Icon(
////                                        Icons.rate_review,
////                                        size: ScreenUtil().setWidth(15),
////                                      )
////                                    ],
////                                  ),
////                                )
//                              else
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
                              'Collected ${getDateCollected(DateTime.parse(
                                  widget.order
                                      .pickupTime))} for £' +
                                  widget.order.price.toString()),
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
                        Text(widget.order.details),
                        Text(
                          'Address: ' + widget.order.details ?? '',
                          softWrap: true,),
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
    await FlutterPhoneDirectCaller.callNumber(widget.order.createBy.phone);
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
        widget.order.pictures[0],
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
              widget.order.tags[0],
              color: CONTRAST_COLOR,
            ),
            SizedBox(
              width: ScreenUtil().setWidth(5),
            ),
            if (widget.order.tags.length > 1)
              Pill(widget.order.tags[1], color: PLACEHOLDER_COLOR),
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
                image: NetworkImage(widget.order.createBy.image),
              ),
            ),
          ),
          SmoothStarRating(
              allowHalfRating: true,
              starCount: 5,
              rating: widget.order.rating,
              size: ScreenUtil().setWidth(15),
              isReadOnly: true,
              color: ALERT_COLOR,
              spacing: 0.0),
        ],
      ),
    );
  }
}
