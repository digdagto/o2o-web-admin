import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';

class MemberTitleWidget extends StatefulWidget {
  const MemberTitleWidget({
    super.key,
    required this.title,
    this.icon = false,
    this.selected = false,
    this.numSizeType = false,
  });

  final String title;
  final bool icon;
  final bool selected;

  final bool numSizeType;

  @override
  State<MemberTitleWidget> createState() => _MemberTitleWidgetState();
}

class _MemberTitleWidgetState extends State<MemberTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.numSizeType
          ? MediaQuery.of(context).size.width * (85 / 1640)
          : MediaQuery.of(context).size.width * (250 / 1640),
      height: 56,
      child: widget.icon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 40,
                ),
                Text(
                  widget.title,
                  style: O2OTheme.lightTheme(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                        fontSize: 18,
                        color: AppColors.defaultBlackColor,
                      ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 2,
                    ),
                    Image.asset(
                      'assets/icon/arrow_up.png',
                      width: 24,
                      height: 16,
                      color: AppColors.iconGreyColor,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Image.asset(
                      'assets/icon/arrow_down.png',
                      width: 24,
                      height: 16,
                      color: AppColors.iconGreyColor,
                    ),
                  ],
                ),
              ],
            )
          : Center(
              child: Text(
                widget.title,
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(
                      fontSize: 18,
                      color: AppColors.defaultBlackColor,
                    ),
              ),
            ),
    );
  }
}
