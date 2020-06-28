import 'package:cheffresh/core/constants/main_tab.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ControllerProvider extends ChangeNotifier {
  PageController mainScreenController =
      PageController(initialPage: MainTab.HOME.index);

  PanelController panelController = PanelController();
}
