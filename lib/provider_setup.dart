import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/providers/preferences/controller_provider.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ChangeNotifierProvider(
      create: (BuildContext context) => ControllerProvider()),
];
