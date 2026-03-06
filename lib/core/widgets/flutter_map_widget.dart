import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../theme/theme.dart';

class FlutterMapWidget extends StatelessWidget {
  const FlutterMapWidget({
    super.key,
    this.latLng = const LatLng(30.0625, 31.3275),
    this.mapController,
  });

  final LatLng latLng;
  final MapController? mapController;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: latLng,
        initialZoom: 16,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.sweet.shop.flutter_sweet_shop_app_ui',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: latLng,
              width: 40,
              height: 40,
              child: Icon(
                Icons.location_pin,
                color: context.theme.appColors.primary,
                size: 40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
