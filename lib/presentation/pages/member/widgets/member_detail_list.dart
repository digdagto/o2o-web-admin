import 'package:flutter/widgets.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_detail_list_row.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_list_title.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailList extends StatelessWidget {
  const MemberDetailList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.lightGreyColor3)),
        child: Column(
          children: [
            Container(
              height: 56,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.lightGreyColor1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width:
                        (MediaQuery.of(context).size.width - 82) * (85 / 1640),
                    child: Text(
                      '구분',
                      style: O2OTheme.lightTheme(context).textTheme.labelLarge,
                    ),
                  ),
                  MemberListTitle(
                    title: '결제일',
                    width:
                        (MediaQuery.of(context).size.width - 82) * (555 / 1640),
                  ),
                  MemberListTitle(
                    title: '결제금액',
                    width:
                        (MediaQuery.of(context).size.width - 82) * (500 / 1640),
                  ),
                  MemberListTitle(
                    title: '포인트',
                    width:
                        (MediaQuery.of(context).size.width - 82) * (500 / 1640),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    MemberDetailListRow(number: (index + 1).toString()),
                itemCount: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
