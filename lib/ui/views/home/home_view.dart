import 'package:cheffresh/core/constants/main_tab.dart';
import 'package:cheffresh/core/providers/preferences/preferences_provider.dart';
import 'package:cheffresh/core/view_models/home/home_view_model.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:cheffresh/ui/views/home/food.dart';
import 'package:cheffresh/ui/views/orders/orders_view.dart';
import 'package:cheffresh/ui/views/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bottom_sliding_bar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PanelController panelController = PanelController();
  MainTab _currentTab = MainTab.HOME;

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
        model: HomeViewModel(),
        builder: (BuildContext context, HomeViewModel model, Widget child) =>
            Scaffold(
                key: scaffoldKey,
                resizeToAvoidBottomInset: true,
                resizeToAvoidBottomPadding: true,
                bottomNavigationBar: buildBottomNavigationBar(),
                body: SafeArea(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: Provider.of<PreferencesProvider>(context)
                        .mainScreenController,
                    onPageChanged: onPageChanged,
                    children: <Widget>[
                      OrdersView(),
                      BottomSlidingBar(
                        body: FoodView(),
                        panelController: panelController,
                      ),
                      SettingsView(),
                    ],
                  ),
                )));
  }

  void onPageChanged(int pageIndex) {
    setState(() {
      _currentTab = MainTab.values[pageIndex];
    });
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('Orders'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          title: Text('Food'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('settings'),
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: BLUE_COLOR,
      currentIndex: _currentTab.index,
      onTap: (index) =>
          Provider
              .of<PreferencesProvider>(context, listen: false)
              .mainScreenController
              .jumpToPage(index),
      selectedFontSize: ScreenUtil().setSp(12),
      unselectedFontSize: ScreenUtil().setSp(12),
    );
  }
}
