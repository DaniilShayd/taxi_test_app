import 'package:flutter/material.dart';
import 'package:taxi_test_app/style/app_text_style.dart';

import '../../../style/app_colors.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key, required this.asset, required this.deliveryMethod, required this.cost, required this.assetPadding});
  final String asset;
  final String deliveryMethod;
  final double cost;
  final EdgeInsetsGeometry assetPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104,
      height: 125,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondary, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12, left: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(deliveryMethod, style: AppTextStyle.bodyMediumTextStyle,),
                Text("$cost ₽", style: AppTextStyle.bodyLargeTextStyle,),
              ],
            ),
          ),
          Padding(
            padding: assetPadding,
            child: Image.asset(asset),
          )
        ],
      ),
    );
  }
}
