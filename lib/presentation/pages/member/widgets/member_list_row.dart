import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_list_content.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberListRow extends StatelessWidget {
  const MemberListRow({
    super.key,
    required this.number,
  });

  final String number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: AppColors.lightGreyColor6,
      onTap: () {
        context.go(
          '/member/detail/11',
        );
      },
      child: SizedBox(
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
            const MemberListContent(text: '김사과'),
            const MemberListContent(
              text: '010-1234-5678',
              textType: true,
            ),
            const MemberListContent(text: '2022-12-20'),
            const MemberListContent(text: '5 회'),
            const MemberListContent(text: '200P'),
          ],
        ),
      ),
    );
  }
}
