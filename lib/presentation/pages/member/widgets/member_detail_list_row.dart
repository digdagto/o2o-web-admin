import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_detail_list_content.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailListRow extends StatelessWidget {
  const MemberDetailListRow({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: [
          SizedBox(
            width: (MediaQuery.of(context).size.width - 82) * (85 / 1640),
            child: Center(
              child: Text(
                number,
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.darkGreyColor3),
              ),
            ),
          ),
          const MemberDetailListContent(
            text: '2022-12-20',
            width: 555,
          ),
          const MemberDetailListContent(
            text: '15,000',
          ),
          const MemberDetailListContent(
            text: '-3,000P',
            textType: -1,
          ),
        ],
      ),
    );
  }
}
