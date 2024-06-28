import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';

class BottomSheetRouteWindow extends StatelessWidget {
  const BottomSheetRouteWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.tabBarDeactive,
            border: Border.all(color: AppColors.secondary, width: 1.0),
            shape: BoxShape.rectangle),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Icon(
                    IconsaxPlusBold.record_circle,
                    color: AppColors.primary,
                    size: 14,
                  ),
                  SizedBox(
                    height: 26,
                    child: DottedLine(
                      direction: Axis.vertical,
                      dashColor: AppColors.secondary,
                      dashLength: 6,
                      lineThickness: 2,
                      dashGapLength: 3,
                    ),
                  ),
                  Icon(
                    IconsaxPlusBold.record_circle,
                    color: AppColors.circleFinalRoute,
                    size: 14,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Откуда", style: AppTextStyle.bodySmallTextStyle),
                  Text(
                    "Садовая ул.",
                    style: AppTextStyle.bodyMediumTextStyle,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.56,
                    child: const Divider(
                      color: Colors.black26,
                      thickness: 1,
                    ),
                  ),
                  Text("Куда", style: AppTextStyle.bodySmallTextStyle),
                  Text(
                    "Садовая ул.",
                    style: AppTextStyle.bodyMediumTextStyle,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 26.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEDF2F5),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: IconButton(
                    onPressed: () {}, icon: Icon(IconsaxPlusLinear.arrow_3)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
