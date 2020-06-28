import 'dart:async';
import 'dart:io';

import 'package:cheffresh/core/view_models/add_food_item/add_food_item_view_model.dart';
import 'package:cheffresh/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddFoodItemView extends StatefulWidget {
  @override
  _AddFoodItemViewState createState() => _AddFoodItemViewState();
}

class _AddFoodItemViewState extends State<AddFoodItemView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var foodItemImages = <File>[];
  var foodTags = <dynamic>[];
  final picker = ImagePicker();
  Set<Marker> markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final mapKey = Key('map');
  final ValueChanged _onChanged = (val) => print(val);
  var categories = ['Pizza', 'Cake', 'Other'];
  bool isFirstTime = false;
  @override
  Widget build(BuildContext context) {
    return BaseView<AddFoodItemViewModel>(
        model: AddFoodItemViewModel(),
        builder: (BuildContext context, AddFoodItemViewModel model,
                Widget child) =>
            Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Add Food',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      model.pop(context);
                    },
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                ),
                key: _scaffoldKey,
                body: model.busy
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : isFirstTime
                        ? Container()
                        : SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: FormBuilder(
                                    // context,
                                    key: _fbKey,
                                    readOnly: false,
                                    child: Column(
                                      children: <Widget>[
                                        FormBuilderTextField(
                                          attribute: 'Name',
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            labelText: 'Name',
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green),
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
                                          attribute: 'Details',
                                          decoration: InputDecoration(
                                            labelText: 'Details',
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green),
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
                                        FormBuilderTextField(
                                          attribute: 'Price',
                                          decoration: InputDecoration(
                                            labelText: 'Price',
                                            suffixIcon:
                                                Icon(Icons.attach_money),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.green),
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
                                            FormBuilderValidators.numeric()
                                          ],
                                          keyboardType: TextInputType.number,
                                        ),
                                        SizedBox(height: 15),
                                        FormBuilderDropdown(
                                          attribute: 'category',
                                          isDense: true,
                                          decoration: InputDecoration(
                                              labelText: 'Category',
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          hint: Text('Select Category'),
                                          validators: [
                                            FormBuilderValidators.required()
                                          ],
                                          items: categories
                                              .map((category) =>
                                                  DropdownMenuItem(
                                                    value: category,
                                                    child: Text('$category'),
                                                  ))
                                              .toList(),
                                        ),
                                        SizedBox(height: 15),
                                        if (foodItemImages.isEmpty)
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: Center(
                                              child: Text(
                                                  'No food images, please add food images'),
                                            ),
                                          ),
                                        if (foodItemImages.isNotEmpty)
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.green)),
                                            child: GridView.count(
                                                shrinkWrap: true,
                                                crossAxisCount: 3,
                                                padding: EdgeInsets.all(0),
                                                children: foodItemImages
                                                    .map((File image) {
                                                  return Stack(
                                                      alignment:
                                                          Alignment.topRight,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: Image.file(
                                                            image,
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          child: Icon(
                                                              Icons
                                                                  .remove_circle,
                                                              color: Colors
                                                                  .red[600]),
                                                          onTap: () {
                                                            setState(() {
                                                              foodItemImages
                                                                  .remove(
                                                                      image);
                                                            });
                                                          },
                                                        ),
                                                      ]);
                                                }).toList()),
                                          ),
                                        SizedBox(height: 15),
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
                                                  SizedBox(width: 15),
                                                  Text(
                                                    'Capture Photo',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 15),
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
                                                  SizedBox(width: 15),
                                                  Text(
                                                    'Add Image',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 15),
                                        FormBuilderFilterChip(
                                          attribute: 'foodTags',
                                          spacing: 10,
                                          showCheckmark: true,
                                          selectedColor: Colors.green[300],
                                          onChanged: (val) {
                                            setState(() {
                                              foodTags = val;
                                            });
                                            print(foodTags);
                                          },
                                          decoration: InputDecoration(
                                              labelText: 'Select many tags',
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.green),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              )),
                                          options: [
                                            FormBuilderFieldOption(
                                                value: 'Desserts',
                                                child: Text('Desserts')),
                                            FormBuilderFieldOption(
                                                value: 'MainCourses',
                                                child: Text('Main Courses')),
                                            FormBuilderFieldOption(
                                                value: 'Pizza',
                                                child: Text('Pizza')),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                RaisedButton(
                                  child: Text(
                                    'Locate your Food location',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  color: Colors.green,
                                  onPressed: () {
                                    return showDialog(
                                        context: context,
                                        builder: (context) {
                                          return StatefulBuilder(
                                              builder: (context, setState) {
                                            return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20,
                                                    vertical: 50),
                                                child: Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: <Widget>[
                                                    GoogleMap(
                                                      mapType: MapType.normal,
                                                      myLocationEnabled: true,
                                                      markers: markers,
                                                      buildingsEnabled: true,
                                                      initialCameraPosition:
                                                          CameraPosition(
                                                              target: LatLng(
                                                                  24, 24),
                                                              zoom: 0),
                                                      myLocationButtonEnabled:
                                                          true,
                                                      onTap: (val) {
                                                        setState(() {
                                                          markers.clear();
                                                          markers.add(Marker(
                                                              markerId: MarkerId(
                                                                  'foodLocation'),
                                                              position: val));
                                                        });
                                                      },
                                                      zoomControlsEnabled: true,
                                                      rotateGesturesEnabled:
                                                          true,
                                                      tiltGesturesEnabled: true,
                                                      scrollGesturesEnabled:
                                                          true,
                                                      zoomGesturesEnabled: true,
                                                      compassEnabled: true,
                                                      mapToolbarEnabled: true,
                                                      key: mapKey,
                                                      onMapCreated:
                                                          (GoogleMapController
                                                              controller) {
                                                        if (!_controller
                                                            .isCompleted) {
                                                          _controller.complete(
                                                              controller);
                                                        }
                                                        setState(() {});
                                                      },
                                                    ),
                                                    RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Colors.green,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Text('Done'),
                                                        onPressed: () {
                                                          Navigator.of(context)
                                                              .pop();
                                                          setState(() {});
                                                        })
                                                  ],
                                                ));
                                          });
                                        });
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: FormBuilderDateTimePicker(
                                    attribute: 'date',
                                    onChanged: _onChanged,
                                    inputType: InputType.both,
                                    decoration: const InputDecoration(
                                      labelText: 'Time of pickup',
                                    ),
                                    validator: (val) => null,
                                    initialValue: DateTime.now(),
                                    // readonly: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          color: Colors.green,
                                          child: Text(
                                            'Add',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                          onPressed: () {
                                            if (_fbKey.currentState
                                                .saveAndValidate()) {
                                              model.addFoodItem(
                                                  form:
                                                      _fbKey.currentState.value,
                                                  foodItemImages:
                                                      foodItemImages,
                                                  foodTags: foodTags);
                                            } else {
                                              print(_fbKey
                                                  .currentState
                                                  .value['contact_person']
                                                  .runtimeType);
                                              print(_fbKey.currentState.value);
                                              print('validation failed');
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          color: Colors.red,
                                          child: Text(
                                            'Reset',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          onPressed: () {
                                            _fbKey.currentState.reset();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )));
  }

  Future<void> _importFoodImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      foodItemImages.add(File(image.path));
    });
  }

  Future<void> _captureFoodImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    setState(() {
      foodItemImages.add(File(image.path));
    });
  }
}
