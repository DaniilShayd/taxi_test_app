import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';
import '../../../style/app_text_style.dart';

class BottomSheetCheckoutButton extends StatelessWidget {
  const BottomSheetCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            minimumSize: Size(300, 64),
            maximumSize: Size(400, 64),
            fixedSize: Size(388, 64),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )
        ),
        child: Text("К оформлению", style: AppTextStyle.CheckoutButtonTextStyle)
    );
  }
}
