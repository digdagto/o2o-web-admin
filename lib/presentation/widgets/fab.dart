import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const CustomFAB({Key? key, required this.onPressed, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: AppColors.primaryOrange,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: child,
      constraints: const BoxConstraints.tightFor(
        width: 59.0,
        height: 42.0,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
