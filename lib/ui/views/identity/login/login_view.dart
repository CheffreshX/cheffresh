import 'package:cheffresh/core/view_models/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../base_view.dart';

class LoginView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        model: LoginViewModel(),
        builder: (BuildContext context, LoginViewModel model, Widget child) =>
            Scaffold(
                key: _scaffoldKey,
                body: SafeArea(
                    child: model.busy
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container())));
  }
}
