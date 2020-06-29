import 'package:cheffresh/core/constants/main_tab.dart';
import 'package:cheffresh/core/view_models/home/home_view_model.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:cheffresh/ui/views/food/food_view.dart';
import 'package:cheffresh/ui/views/orders/orders_view.dart';
import 'package:cheffresh/ui/views/settings/more_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  MainTab _currentTab = MainTab.HOME;
  int currentScreen = 1;
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
                body: SafeArea(child: getScreen(currentScreen))));
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
          icon: Icon(Icons.more_horiz),
          title: Text('more'),
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.green,
      currentIndex: currentScreen,
      onTap: (index) {
        setState(() {
          currentScreen = index;
        });
      },
      selectedFontSize: ScreenUtil().setSp(12),
      unselectedFontSize: ScreenUtil().setSp(12),
    );
  }

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return OrdersView();
      case 1:
        return FoodView();
      case 2:
        return SettingsView();
    }
    return null;
  }
}
