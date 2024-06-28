import 'package:flutter/material.dart';

import '../../style/app_text_style.dart';

class TabItem extends StatelessWidget {
  final String title;

  const TabItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 36,
      child: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.headlineTextStyle,
      ),
    );
  }
}