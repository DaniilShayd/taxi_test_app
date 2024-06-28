import 'package:flutter/material.dart';
import 'package:taxi_test_app/widgets/coords/app_coords.dart';
import 'package:taxi_test_app/widgets/session_page/session_page.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';


class TaxiApp extends StatefulWidget {
  const TaxiApp({super.key});

  @override
  State<TaxiApp> createState() => _TaxiAppState();

}

class _TaxiAppState extends State<TaxiApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(future: requestRoutes(), builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        else{
          return SessionPage(
            AppCoords.startPlacemark,
            AppCoords.endPlacemark,
            snapshot.data!.$1,
            snapshot.data!.$2,
          );
        }
      }),
    );
  }


  Future<(DrivingSession, Future<DrivingSessionResult>)> requestRoutes() async {
    print('Points: ${AppCoords.startPlacemark.point},${AppCoords.stopByPlacemark.point},${AppCoords.endPlacemark.point}');

    var resultWithSession = await YandexDriving.requestRoutes(
        points: [
          RequestPoint(point: AppCoords.startPlacemark.point, requestPointType: RequestPointType.wayPoint),
          RequestPoint(point: AppCoords.stopByPlacemark.point, requestPointType: RequestPointType.viaPoint),
          RequestPoint(point: AppCoords.endPlacemark.point, requestPointType: RequestPointType.wayPoint),
        ],
        drivingOptions: const DrivingOptions(
            initialAzimuth: 0,
            routesCount: 5,
            avoidTolls: true
        )
    );
    return resultWithSession;

  }
}


