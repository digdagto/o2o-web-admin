import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/member_title_widget.dart';

class MemberTitleListWidget extends StatelessWidget {
  const MemberTitleListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        MemberTitleWidget(
          title: '구분',
          numSizeType: true,
        ),
        MemberTitleWidget(
          title: '이름',
          icon: true,
        ),
        MemberTitleWidget(
          title: '전화번호',
          icon: true,
        ),
        MemberTitleWidget(
          title: '가입일',
          icon: true,
        ),
        MemberTitleWidget(
          title: '방문 수',
          icon: true,
        ),
        MemberTitleWidget(
          title: '보유 포인트',
          icon: true,
        ),
      ],
    );
  }
}
