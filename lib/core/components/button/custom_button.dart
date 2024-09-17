import 'package:flutter/material.dart';
import 'package:unitask_demo/core/components/loaders/custom_loader.dart';
import 'package:unitask_demo/core/config/size_config.dart';
import 'package:unitask_demo/core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final double? width;
  final bool isActive;
  final double? height;
  final bool showLoader;
  final Color? borderColor;
  final TextStyle? textStyle;
  final String? buttonText;
  final double borderRadius;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.child,
    this.width,
    this.height,
    this.isActive = true,
    this.borderRadius = 8.0,
    required this.onPressed,
    this.showLoader = false,
    this.buttonText,
    this.color,
    this.borderColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      width:
          width != null ? width! * SizeConfig.widthMultiplier : double.infinity,
      height: (height ?? 48) * SizeConfig.heightMultiplier,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              color ?? (isActive ? AppColors.primary100 : AppColors.white),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                color: borderColor ??
                    (isActive ? AppColors.primary100 : AppColors.white)),
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
        ),
        onPressed: onPressed,
        child: showLoader
            ? const CommonLoader()
            : child ?? Text(buttonText ?? "", style: textStyle),
      ),
    );
  }
}
