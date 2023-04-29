import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberListContent extends StatelessWidget {
  const MemberListContent({
    super.key,
    required this.text,
    this.textType = false,
  });

  final String text;
  final bool textType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 82) * (311 / 1640),
      child: Center(
        child: Text(
          text,
          style: O2OTheme.lightTheme(context).textTheme.bodyLarge!.copyWith(
                color:
                    textType ? AppColors.blueColor1 : AppColors.darkGreyColor3,
                decoration:
                    textType ? TextDecoration.underline : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
