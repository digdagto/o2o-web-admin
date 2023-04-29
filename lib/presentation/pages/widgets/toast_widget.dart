import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';

class ToastWidget extends StatelessWidget {
  const ToastWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.darkGreyColor2,
            borderRadius: BorderRadius.circular(31)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 18),
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
