import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_delete_dialog.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_detail_list.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_detail_top_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailPage extends StatelessWidget {
  const MemberDetailPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 23.0, left: 40, right: 40, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const MemberDetailTopWidget(),
          const SizedBox(
            height: 40,
          ),
          const MemberDetailList(),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const MemberDeleteDialog(),
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: 102,
              height: 48,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AppColors.lightGreyColor3)),
              child: Text(
                '회원 삭제',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.darkGreyColor3),
              ),
            ),
          )
        ],
      ),
    );
  }
}
