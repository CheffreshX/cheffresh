import 'package:cheffresh/core/view_models/splash/splash_view_model.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);
    return BaseView<SplashViewModel>(
        model: SplashViewModel(),
        onModelReady: (SplashViewModel model) async {
          await model.onReady();
        },
        builder: (BuildContext context, SplashViewModel model, Widget child) =>
            Scaffold(
              body: SafeArea(
                child: Center(
                    child: Container(
                      color: Colors.lightGreenAccent,
                    )),
              ),
            ));
  }
}
