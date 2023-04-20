import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';

class MemberWidget extends StatelessWidget {
  const MemberWidget({
    super.key,
    required this.text,
    this.phoneType = false,
    this.numSizeType = false,
  });

  final String text; // 내용
  final bool phoneType; // 전화번호인지 아닌지 (텍스트 색상,모양차이)
  final bool numSizeType; // 구분인지 아닌지 (너비 차이)

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: numSizeType
          ? MediaQuery.of(context).size.width * (85 / 1640)
          : MediaQuery.of(context).size.width * (250 / 1640),
      child: Center(
        child: Text(
          text,
          style: O2OTheme.lightTheme(context).textTheme.bodyLarge!.copyWith(
                color: phoneType
                    ? AppColors.mobileNumberColor
                    : AppColors.defaultGreyColor,
                decoration:
                    phoneType ? TextDecoration.underline : TextDecoration.none,
              ),
        ),
      ),
    );
  }
}
