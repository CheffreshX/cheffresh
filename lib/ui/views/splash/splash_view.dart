import 'package:cheffresh/core/constants/image_paths.dart';
import 'package:cheffresh/core/view_models/splash/splash_view_model.dart';
import 'package:cheffresh/ui/shared/colors.dart';
import 'package:cheffresh/ui/shared/loading.dart';
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
                child: Container(
                  width: double.maxFinite,
                  height: ScreenUtil.screenHeight,
                  color: SPLASH_COLOR,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.screenHeight / 30,
                        ),
                        Image(
                          image: AssetImage(ImagePaths.LOGO),
                          fit: BoxFit.contain,
                        ),
                        if (model.busy) LoadingView()
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
