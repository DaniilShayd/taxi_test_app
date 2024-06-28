import 'package:flutter/material.dart';

import 'bottom_sheet_checkout_button.dart';
import 'bottom_sheet_route_window.dart';
import 'bottom_sheet_tab_bar.dart';
import 'delivery_card.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 484.0,
      decoration: const BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
                offset: Offset(5, 10),
                spreadRadius: 0.1,
                blurStyle: BlurStyle.normal),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0))),
      child: const Column(
        children: [
          BottomSheetTabBar(),
          Padding(padding: EdgeInsets.all(6)),
          BottomSheetRouteWindow(),
          Padding(padding: EdgeInsets.all(6)),
          Padding(
            padding: EdgeInsets.only(left: 20, bottom: 24),
            child: Row(
              children: [
                DeliveryCard(
                  asset: 'assets/delivery_dard_on_foot.png',
                  deliveryMethod: 'Пешком',
                  cost: 550,
                  assetPadding: EdgeInsets.only(bottom: 53, left: 14),
                ),
                Padding(padding: EdgeInsets.all(4)),
                DeliveryCard(
                  asset: 'assets/delivery_card_car.png',
                  deliveryMethod: 'Легковая',
                  cost: 330,
                  assetPadding: EdgeInsets.only(bottom: 62, left: 8),
                )
              ],
            ),
          ),
          BottomSheetCheckoutButton()
        ],
      ),
    );
  }
}
