import 'package:flutter/material.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_dims.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:url_launcher/url_launcher.dart';

class FxShowLocation extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final int? initialZoomLevel;
  final double? maxZoomLevel;

  const FxShowLocation({
    Key? key,
    this.latitude,
    this.longitude,
    this.initialZoomLevel,
    this.maxZoomLevel,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FxShowLocationState();
  }
}

class _FxShowLocationState extends State<FxShowLocation> {
  late double _latitude;
  late double _longitude;
  late int _initialZoomLevel;
  late double _maxZoomLevel;

  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    // TODO: implement initState

    _latitude = widget.latitude ?? 30.291314113953575;
    _longitude = widget.longitude ?? 57.067726807889755;
    _initialZoomLevel = widget.initialZoomLevel ?? 13;
    _maxZoomLevel = widget.maxZoomLevel ?? 20;

    _zoomPanBehavior = MapZoomPanBehavior(
        enableDoubleTapZooming: true,
        enablePanning: true,
        maxZoomLevel: _maxZoomLevel);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final LocationData currentLocation = LocationData(LatLng(29.619307268182446, 52.524025272119665));
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Image.asset(
            "packages/fx_flutterap_components/assets/images/googlemap.png",
            width: InitialDims.icon10,
            height: InitialDims.icon10,
          ),
          onPressed: () async {
            await launchUrl(Uri.parse(
                "https://maps.google.com/?ll=$_latitude,$_longitude"));
          },
        ),
        body: SfMaps(
          layers: [
            MapTileLayer(
              zoomPanBehavior: _zoomPanBehavior,
              initialFocalLatLng: MapLatLng(_latitude, _longitude),
              initialZoomLevel: _initialZoomLevel,
              initialMarkersCount: 1,
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              markerBuilder: (BuildContext context, int index) {
                return MapMarker(
                  latitude: _latitude,
                  longitude: _longitude,
                  size: const Size(20, 20),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red[800],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
