import 'package:cheffresh/core/services/firestore_functions.dart';
import 'package:cheffresh/locator_setup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/providers/controller/controller_provider.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ChangeNotifierProvider(
      create: (BuildContext context) => ControllerProvider()),
  StreamProvider<FirebaseUser>.value(
    value: FirebaseAuth.instance.onAuthStateChanged,
  ),
  ChangeNotifierProvider(
    create: (_) => locator<FirestoreFunctions>(),
  ),
];
