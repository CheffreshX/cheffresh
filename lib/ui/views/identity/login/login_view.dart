import 'package:cheffresh/ui/views/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_view_model.dart';

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
