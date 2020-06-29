import 'package:cheffresh/core/constants/routes.dart';
import 'package:cheffresh/core/view_models/login/login_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base_view.dart';

class LoginView extends StatefulWidget {
  static final CountryCode DEFAULT_COUNTRY_CODE = CountryCode.fromCode('GB');

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  CountryCode countryCode = LoginView.DEFAULT_COUNTRY_CODE;

  final GlobalKey<FormBuilderState> _formBuilderKey =
      GlobalKey<FormBuilderState>();

  void login(LoginViewModel model) async {
    if (_formBuilderKey.currentState.saveAndValidate()) {
      print(_formBuilderKey.currentState.value);
      await model.verify(
        countryCode.toString() +
            _formBuilderKey.currentState.value['mobileNumber'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      builder: (BuildContext context, LoginViewModel model, Widget child) {
        return Scaffold(
          appBar: defaultAppBar(
            title: 'Login',
          ),
          resizeToAvoidBottomPadding: true,
          body: model.busy
              ? LoginView()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(20),
                      horizontal: ScreenUtil().setWidth(25)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/logo_transparent.png',
                            height: 160),
                        SizedBox(height: 40),
                        FormBuilder(
                          key: _formBuilderKey,
                          autovalidate: false,
                          readOnly: false,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: CountryCodePicker(
                                      initialSelection: countryCode.toString(),
                                      hideMainText: true,
                                      showFlagMain: true,
                                      showFlag: true,
                                      hideSearch: false,
                                      showCountryOnly: true,
                                      showOnlyCountryWhenClosed: true,
                                      alignLeft: true,
                                      onChanged: (c) {
                                        print(c.toString());
                                        countryCode = c;
                                        print(
                                            'Previously ${_formBuilderKey.currentState.value}, now ${countryCode.toString()}');
                                        _formBuilderKey.currentState
                                            .setAttributeValue(
                                                'mobileNumber', countryCode);
                                        setState(() {});
                                      },
                                      favorite: ['US', 'GB', 'EG', 'DE', 'FR'],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(countryCode.toString()),
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: FormBuilderTextField(
                                        onFieldSubmitted: (_) {
                                          login(model);
                                        },
                                        autofocus: true,
                                        attribute: 'mobileNumber',
                                        decoration: InputDecoration(
                                            hintText: '7123 456789',
                                            focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Colors.green)),
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide()),
                                            labelStyle:
                                                TextStyle(color: Colors.green),
                                            labelText: 'Phone'),
                                        validators: [
                                          FormBuilderValidators.required(
                                              errorText:
                                                  'Please enter valid phone number'),
                                        ],
                                        keyboardType: TextInputType.phone,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setWidth(20.0)),
                          child: MaterialButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              color: Colors.green,
                              child: Text(
                                'Login',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                login(model);
                              }),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setWidth(20.0)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Has no account? ',
                                style: TextStyle(fontSize: 16),
                              ),
                              GestureDetector(
                                  child: Text(
                                    'Register Now',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.green,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    model.goTo(context,
                                        path: RoutePaths.Register);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
