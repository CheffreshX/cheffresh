import 'package:cheffresh/core/view_models/login/login_view_model.dart';
import 'package:cheffresh/ui/shared/app_bar.dart';
import 'package:cheffresh/ui/shared/buttons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base_view.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<StatefulWidget> {
  final GlobalKey<FormBuilderState> _formBuilderKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    String countryCode;
    return BaseView<LoginViewModel>(
      model: LoginViewModel(),
      builder: (BuildContext context, LoginViewModel model, Widget child) =>
          Scaffold(
        appBar: defaultAppBar(
          title: 'Login',
          onPressed: () => model.pop(context),
        ),
        resizeToAvoidBottomPadding: true,
        body: model.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                child: Column(
                  children: <Widget>[
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
                                  hideMainText: true,
                                  showFlagMain: true,
                                  showFlag: true,
                                  hideSearch: false,
                                  showCountryOnly: true,
                                  showOnlyCountryWhenClosed: true,
                                  alignLeft: true,
                                  onChanged: (c) {
                                    print(c.toString());
                                    countryCode = c.toString();
                                  },
                                  favorite: ['+39', 'FR'],
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: FormBuilderTextField(
                                    autofocus: true,
                                    attribute: 'mobileNumber',
                                    decoration: InputDecoration(
                                        hintText: '010000000000',
                                        labelStyle:
                                            TextStyle(color: Colors.indigo),
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
                      child: buildRaisedButton(
                        text: 'Login',
                        onPressed: () async {
                          if (_formBuilderKey.currentState.saveAndValidate()) {
                            print(_formBuilderKey.currentState.value);
                            await model.verify(
                              countryCode +
                                  _formBuilderKey
                                      .currentState.value['mobileNumber'],
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
