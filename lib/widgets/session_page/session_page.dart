import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:taxi_test_app/style/app_colors.dart';
import 'package:taxi_test_app/style/app_text_style.dart';
import 'package:taxi_test_app/widgets/bottom_sheet/app_bottom_sheet.dart';
import 'package:taxi_test_app/widgets/bottom_sheet/bottom_sheet_checkout_button.dart';
import 'package:taxi_test_app/widgets/bottom_sheet/bottom_sheet_tab_bar.dart';
import 'package:taxi_test_app/widgets/bottom_sheet/delivery_card.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../bottom_sheet/bottom_sheet_route_window.dart';
import '../tab_bar/tab_item.dart';

class SessionPage extends StatefulWidget {
  final Future<DrivingSessionResult> result;
  final DrivingSession session;
  final PlacemarkMapObject startPlacemark;
  final PlacemarkMapObject endPlacemark;
  bool bottomSheetIsActivated = false;

  SessionPage(this.startPlacemark, this.endPlacemark, this.session, this.result,
      {super.key});

  @override
  _SessionState createState() => _SessionState();
}

class _SessionState extends State<SessionPage> {
  late final List<MapObject> mapObjects = [
    widget.startPlacemark,
    widget.endPlacemark
  ];

  final List<DrivingSessionResult> results = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showModalBottomSheet(
          barrierColor: AppColors.bottomSheetBarier,
          context: context,
          builder: (builder) {
            return AppBottomSheet();
          });
    });
    _init();
  }

  @override
  void dispose() {
    super.dispose();
    _close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    YandexMap(
                      mapObjects: mapObjects,
                      onMapCreated:
                          (YandexMapController yandexMapController) async {
                        final geometry = Geometry.fromBoundingBox(
                            const BoundingBox(
                                northEast: Point(
                                    latitude: 51.69852, longitude: 39.15115),
                                southWest: Point(
                                    latitude: 51.71988, longitude: 39.1884)));

                        await yandexMapController
                            .moveCamera(CameraUpdate.newGeometry(geometry));
                        // await yandexMapController
                        //     .moveCamera(CameraUpdate.zoomOut());
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                ),
                child: IconButton(
                    style: IconButton.styleFrom(
                        fixedSize: Size(56, 56),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: () {},
                    icon: Icon(Icons.more_horiz)),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  right: 20,
                ),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(171, 42),
                        backgroundColor: Color(0xFF09C76C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                    onPressed: () {},
                    child: Text("Маркетплейсы", style: AppTextStyle.MarketplacesButtonTextStyle, textAlign: TextAlign.center
                      ,),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _close() async {
    await widget.session.close();
  }

  Future<void> _init() async {
    await _handleResult(await widget.result);
  }

  Future<void> _handleResult(DrivingSessionResult result) async {
    if (result.error != null) {
      print('Error: ${result.error}');
      return;
    }

    setState(() {
      results.add(result);
    });
    setState(() {
      result.routes!.asMap().forEach((i, route) {
        mapObjects.add(PolylineMapObject(
          mapId: MapObjectId('route_${i}_polyline'),
          polyline: route.geometry,
          strokeColor: Colors.redAccent,
          strokeWidth: 3,
        ));
      });
    });
  }
}
