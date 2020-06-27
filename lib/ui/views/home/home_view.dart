import 'package:cheffresh/core/view_models/home/home_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/views/base/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'bottom_sliding_bar.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PanelController panelController = PanelController();
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
                bottomNavigationBar: buildBottomNavigationBar(),
                body: SafeArea(
                    child: model.busy
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : BottomSlidingBar(
                            body: FoodView(),
                            panelController: panelController,
                          ))));
  }

  AppBar buildAppBar() {
    return defaultAppBar(title: 'Home');
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          activeIcon: Icon(Icons.history),
          title: Text('Contact us'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          activeIcon: Icon(Icons.fastfood),
          title: Text('Contact us'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          activeIcon: Icon(Icons.more_horiz),
          title: Text('Contact us'),
        ),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      selectedItemColor: BLUE_COLOR,
      onTap: _onItemTapped,
      selectedFontSize: ScreenUtil().setSp(12),
      unselectedFontSize: ScreenUtil().setSp(12),
    );
  }
}

class FoodView extends StatelessWidget {
  const FoodView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: const Text('Food Screen'));
  }
}
