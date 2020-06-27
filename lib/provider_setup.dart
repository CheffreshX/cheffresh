import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/providers/preferences/preferences_provider.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ChangeNotifierProvider(
      create: (BuildContext context) => PreferencesProvider()),
];
