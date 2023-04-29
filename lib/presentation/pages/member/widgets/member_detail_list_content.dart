import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailListContent extends StatelessWidget {
  const MemberDetailListContent({
    super.key,
    required this.text,
    this.textType = 0,
    this.width = 500,
  });

  final String text;
  final int textType;
  final int width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 82) * (width / 1640),
      child: Center(
        child: Text(
          text,
          style: O2OTheme.lightTheme(context).textTheme.bodyLarge!.copyWith(
                color: textType == 1
                    ? AppColors.blueColor1
                    : textType == -1
                        ? AppColors.redColor1
                        : AppColors.darkGreyColor3,
              ),
        ),
      ),
    );
  }
}
