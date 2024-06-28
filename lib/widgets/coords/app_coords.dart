import 'package:yandex_mapkit/yandex_mapkit.dart';

abstract class AppCoords {
  static final PlacemarkMapObject startPlacemark = PlacemarkMapObject(
    mapId: const MapObjectId('start_placemark'),
    point: const Point(latitude: 51.70118, longitude: 39.16447),
    icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage('lib/assets/route_start.png'),
            scale: 0.3
        )
    ),
  );
  static final PlacemarkMapObject stopByPlacemark = PlacemarkMapObject(
    mapId: const MapObjectId('stop_by_placemark'),
    point: const Point(latitude: 51.70702, longitude:  39.17272),
    icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage('lib/assets/route_stop_by.png'),
            scale: 0.3
        )
    ),
  );
  static final PlacemarkMapObject endPlacemark = PlacemarkMapObject(
      mapId: const MapObjectId('end_placemark'),
      point: const Point(latitude: 51.71705, longitude: 39.173),
      icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
              image: BitmapDescriptor.fromAssetImage('lib/assets/route_end.png'),
              scale: 0.3
          )
      )
  );
}