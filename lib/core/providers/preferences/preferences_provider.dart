import 'package:cheffresh/core/constants/main_tab.dart';
import 'package:flutter/material.dart';

class PreferencesProvider extends ChangeNotifier {
  PageController mainScreenController =
      PageController(initialPage: MainTab.HOME.index);
}
