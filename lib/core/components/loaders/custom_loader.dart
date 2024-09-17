import 'package:flutter/material.dart';
import 'package:unitask_demo/core/config/size_config.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.primary300,
      strokeWidth: 5 * SizeConfig.widthMultiplier,
    );
  }
}
