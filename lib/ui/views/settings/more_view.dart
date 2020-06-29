import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/view_models/settings/settings_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/shared/dialogs.dart';
import 'package:cheffresh/ui/shared/loading.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsViewModel>(
        model: SettingsViewModel(),
        builder: (BuildContext context, SettingsViewModel model,
                Widget child) =>
            Scaffold(
              appBar: defaultAppBar(
                title: 'More',
              ),
              body: model.busy
                  ? LoadingView()
                  : ListView(
                      children: ListTile.divideTiles(
                          color: PRIMARY_COLOR,
                          context: context,
                          tiles: <Widget>[
                            ListTile(
                              title: Text(
                                'Add Food',
                              ),
                              onTap: () {
                                model.goTo(context, path: RoutePaths.AddFood);
                              },
                            ),
                            ListTile(
                              title: Text(
                                'About us',
                              ),
                              onTap: () {
                                displayDialog(
                                    'This project created as a part of #Hack20 - Online International Flutter Hackathon 2020');
                              },
                            ),
                            ListTile(
                              title: Text(
                                'Logout',
                              ),
                              onTap: () {
                                model.logout();
                              },
                            ),
                          ]).toList(),
                    ),
            ));
  }
}
