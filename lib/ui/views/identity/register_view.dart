import 'dart:async';
import 'dart:io';

import 'package:cheffresh/core/view_models/register/register_view_model.dart';
import 'package:cheffresh/ui/shared/loading.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File personImage;
  LocationResult result;
  final picker = ImagePicker();
  Set<Marker> markers = {};
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final mapKey = Key('map');
  final ValueChanged _onChanged = (val) => print(val);

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        model: RegisterViewModel(),
        builder: (BuildContext context, RegisterViewModel model,
                Widget child) =>
            Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Register',
                    style: TextStyle(color: Colors.green),
                  ),
                  centerTitle: true,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.green),
                    onPressed: () {
                      model.pop(context);
                    },
                  ),
                ),
                key: _scaffoldKey,
                body: model.busy
                    ? LoadingView()
                    : SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20),
                            Padding(
                              padding: EdgeInsets.all(20.0),
                              child: FormBuilder(
                                key: _fbKey,
                                readOnly: false,
                                child: Column(
                                  children: <Widget>[
                                    FormBuilderTextField(
                                      attribute: 'Name',
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        labelText: 'Full Name',
                                        labelStyle:
                                            TextStyle(color: Colors.green),
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onChanged: _onChanged,
                                      validators: [
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(4),
                                      ],
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(height: 15),
                                    FormBuilderTextField(
                                      attribute: 'Address',
                                      decoration: InputDecoration(
                                        labelText: 'Address',
                                        labelStyle:
                                            TextStyle(color: Colors.green),
                                        isDense: true,
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onChanged: _onChanged,
                                      validators: [
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(16),
                                      ],
                                      keyboardType: TextInputType.text,
                                    ),
                                    SizedBox(height: 15),
                                    FormBuilderPhoneField(
                                      attribute: 'Phone',
                                      decoration: InputDecoration(
                                        labelText: 'Phone',
                                        labelStyle:
                                            TextStyle(color: Colors.green),
                                        isDense: true,
                                        suffixIcon: Icon(Icons.phone_android,
                                            color: Colors.green),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.green),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onChanged: _onChanged,
                                      validators: [
                                        FormBuilderValidators.required(),
                                        FormBuilderValidators.minLength(11),
                                        FormBuilderValidators.numeric()
                                      ],
                                      keyboardType: TextInputType.number,
                                    ),
                                    SizedBox(height: 15),
                                    Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: personImage != null
                                            ? Colors.green
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: personImage != null
                                              ? Image.file(personImage,
                                                  width: 160,
                                                  height: 160,
                                                  fit: BoxFit.cover)
                                              : Icon(Icons.person,
                                                  color: Colors.green,
                                                  size: 160)),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Your Profile Picture',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          color: Colors.orange[700],
                                          onPressed: _captureFoodImage,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.add_a_photo,
                                                  color: Colors.white),
                                              SizedBox(width: 12),
                                              Text(
                                                'Camera',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          color: Colors.green,
                                          onPressed: _importFoodImage,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(Icons.image,
                                                  color: Colors.white),
                                              SizedBox(width: 12),
                                              Text(
                                                'Gallery',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      width: 175,
                                      child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        color: Colors.red,
                                        onPressed: () {
                                          setState(() {
                                            personImage = null;
                                          });
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.delete_forever,
                                                color: Colors.white),
                                            SizedBox(width: 12),
                                            Text(
                                              'Delete',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                  ],
                                ),
                              ),
                            ),
                            if (result != null)
                              Text(
                                result.address ?? result.latLng.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            SizedBox(height: 10),
                            RaisedButton(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.location_on, color: Colors.white),
                                  SizedBox(width: 12),
                                  Text(
                                    'Locate your location',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.orange[700],
                              onPressed: () async {
                                result = await showLocationPicker(context,
                                    'AIzaSyBl9ifEBx9VDw3TswNpD1GGm8ZH2NJhyeo');
                                setState(() {});
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(40.0),
                              child: MaterialButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                color: Colors.green,
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  if (_fbKey.currentState.saveAndValidate() &&
                                      result != null) {
                                    model.register(result.latLng,
                                        _fbKey.currentState.value, personImage);
                                  } else {
                                    print(_fbKey.currentState
                                        .value['contact_person'].runtimeType);
                                    print(_fbKey.currentState.value);
                                    print('validation failed');
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      )));
  }

  Future<void> _importFoodImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      personImage = File(image.path);
    });
  }

  Future<void> _captureFoodImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      personImage = File(image.path);
    });
  }
}
