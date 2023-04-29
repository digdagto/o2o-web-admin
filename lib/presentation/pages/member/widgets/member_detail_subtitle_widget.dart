import 'package:flutter/widgets.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailSubtitleWidget extends StatelessWidget {
  const MemberDetailSubtitleWidget({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: O2OTheme.lightTheme(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 20, color: AppColors.darkGreyColor1),
        ),
        const SizedBox(
          width: 16,
        ),
        Text(
          content,
          style: O2OTheme.lightTheme(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 20, color: AppColors.orangeColor1),
        ),
      ],
    );
  }
}
