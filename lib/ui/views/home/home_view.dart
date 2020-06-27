import 'package:cheffresh/core/view_models/home/home_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/views/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        model: HomeViewModel(),
        builder: (BuildContext context, HomeViewModel model, Widget child) =>
            Scaffold(
                key: scaffoldKey,
                appBar: buildAppBar(),
                resizeToAvoidBottomInset: true,
                resizeToAvoidBottomPadding: true,
                body: SafeArea(
                    child: model.busy
                        ? const Center(
                      child: CircularProgressIndicator(),
                    )
                        : Container(child: const Text('Home Screen')))));
  }

  AppBar buildAppBar() {
    return defaultAppBar(title: 'Home');
  }
}
