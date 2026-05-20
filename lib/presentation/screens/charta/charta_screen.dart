import 'package:flu_avm/presentation/widgets/complere_form.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class ChartaScreen extends StatefulWidget {
  const ChartaScreen({super.key});

  @override
  State<ChartaScreen> createState() => _ChartaScreenState();
}

class _ChartaScreenState extends State<ChartaScreen> {
  CircleAnnotationManager? _circleAnnotationManager;

  void _initializeCircleAnnotations(MapboxMap mapboxMap) {
    mapboxMap.annotations.createCircleAnnotationManager().then((manager) {
      _circleAnnotationManager = manager;
      _addeVelRenovareMarker();
    });
  }

  Future<void> _addeVelRenovareMarker() async {
    final manager = _circleAnnotationManager;
    if (manager == null) return;

    // ignore: unused_local_variable
    final situs = Position(-122.467895, 37.800126);
    // ignore: unused_local_variable
    final color = Colors.red.toARGB32();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapas'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          MapWidget(
            key: const ValueKey('main_map'),
            viewport: CameraViewportState(
              center: Point(
                coordinates: Position(-122.467895, 37.800126),
              ),
              zoom: 14.5,
            ),
            styleUri: MapboxStyles.MAPBOX_STREETS,
            onMapCreated: (controller) {
              _initializeCircleAnnotations(controller);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ComplereForm(),
            ),
          ),
        ],
      ),
    );
  }
}