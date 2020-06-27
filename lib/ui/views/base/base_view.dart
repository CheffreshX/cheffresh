import 'dart:async';

import 'package:cheffresh/core/services/connectivity/connectivity_service.dart';
import 'package:cheffresh/ui/shared/snackbars.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends ChangeNotifier> extends StatefulWidget {
  const BaseView({
    Key key,
    this.builder,
    this.model,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseView<T>> {
  T model;
  final connectionStatus = ConnectivityService.getInstance();
  StreamSubscription connectivitySubscription;

  @override
  void initState() {
    model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    if (connectionStatus.hasConnection != null &&
        !connectionStatus.hasConnection) {
      showNoInternetConnectionSnackbar();
    }

    connectivitySubscription =
        connectionStatus.connectionChange.listen((hasConnection) {
      if (hasConnection != null && !hasConnection) {
        showNoInternetConnectionSnackbar();
      }
      setState(() {}); //this ensures snackbar appears quickly
    });

    super.initState();
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
