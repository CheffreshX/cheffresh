import 'package:cheffresh/core/view_models/orders/orders_view_model.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrdersView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<OrdersViewModel>(
        model: OrdersViewModel(),
        builder: (BuildContext context, OrdersViewModel model, Widget child) =>
            SafeArea(
                child: model.busy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text('Orders view')));
  }
}
