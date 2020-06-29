import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class MapWithMarker extends StatefulWidget {
  LatLng latLng;
  CameraPosition position;

  MapWithMarker({
    Key key,
    @required LatLng location,
  }) : super(key: key) {
    latLng = location;
    position = CameraPosition(
      target: latLng,
      zoom: 14.4746,
    );
  }

  @override
  State<StatefulWidget> createState() => _MapWithMarkerState();
}

class _MapWithMarkerState extends State<MapWithMarker> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeLeft: true,
      removeRight: true,
      child: Container(
        height: ScreenUtil().setHeight(100),
        child: GoogleMap(
          circles: {Circle(circleId: CircleId(widget.latLng.toString()))},
          onTap: (_) {
            return showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, setState) {
                    return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            GoogleMap(
                              mapType: MapType.normal,
                              circles: {
                                Circle(
                                    circleId:
                                        CircleId(widget.latLng.toString()))
                              },
                              myLocationEnabled: true,
                              markers: {
                                Marker(
                                  visible: true,
                                  markerId: MarkerId(widget.latLng.toString()),
                                  position: widget.latLng,
                                  anchor: Offset(0.5, 0.5),
                                )
                              },
                              buildingsEnabled: true,
                              initialCameraPosition: widget.position,
                              myLocationButtonEnabled: true,
                              zoomControlsEnabled: true,
                              rotateGesturesEnabled: true,
                              tiltGesturesEnabled: true,
                              scrollGesturesEnabled: true,
                              zoomGesturesEnabled: true,
                              compassEnabled: true,
                              mapToolbarEnabled: true,
                              onMapCreated: (GoogleMapController controller) {
                                if (!_controller.isCompleted) {
                                  _controller.complete(controller);
                                }
                                setState(() {});
                              },
                            ),
                            RaisedButton(
                                textColor: Colors.white,
                                color: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text('Done'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                })
                          ],
                        ));
                  });
                });
          },
          mapType: MapType.normal,
          initialCameraPosition: widget.position,
          zoomControlsEnabled: false,
          zoomGesturesEnabled: false,
          markers: {
            Marker(
              visible: true,
              markerId: MarkerId(widget.latLng.toString()),
              position: widget.latLng,
              anchor: Offset(0.5, 0.5),
            )
          },
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
