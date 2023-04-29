import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_list_row.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_list_title.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/upper_part_widget.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/dialog_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, left: 40, right: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const UpperPartWidget(),
          const SizedBox(
            height: 39,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.lightGreyColor3,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.lightGreyColor3),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: (MediaQuery.of(context).size.width - 82) *
                              (85 / 1640),
                          child: Text(
                            '구분',
                            style: O2OTheme.lightTheme(context)
                                .textTheme
                                .labelLarge,
                          ),
                        ),
                        const MemberListTitle(title: '이름'),
                        const MemberListTitle(title: '전화번호'),
                        const MemberListTitle(title: '가입일'),
                        const MemberListTitle(title: '방문 수'),
                        const MemberListTitle(title: '보유 포인트'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          MemberListRow(number: (index + 1).toString()),
                      itemCount: 20,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 38),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const DialogWidget();
                  },
                );
              },
              child: Container(
                alignment: Alignment.center,
                width: 112,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.orangeColor1,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '회원 등록',
                      style: O2OTheme.lightTheme(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
