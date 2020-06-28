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
            print('Open the google maps navigation');
          },
          mapType: MapType.hybrid,
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
