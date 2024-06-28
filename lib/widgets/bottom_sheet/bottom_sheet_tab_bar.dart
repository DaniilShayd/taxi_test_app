import 'package:flutter/material.dart';

import '../../../style/app_colors.dart';
import '../tab_bar/tab_item.dart';

class BottomSheetTabBar extends StatelessWidget {
  const BottomSheetTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
        decoration: BoxDecoration(
          borderRadius:
          const BorderRadius.all(Radius.circular(12)),
          color: AppColors.tabBarDeactive,
        ),
        child: const TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          indicator: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          labelColor: AppColors.tabBarActiveText,
          unselectedLabelColor: AppColors.tabBarDeactiveText,
          tabs: [
            TabItem(title: 'Город'),
            TabItem(title: 'FBO'),
            TabItem(title: 'FBS'),
            TabItem(title: 'Сборный FBS'),
          ],
        ),
      ),
    );
  }
}
