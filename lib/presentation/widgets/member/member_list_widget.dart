import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/member_widget.dart';

class MemberListWidget extends StatelessWidget {
  const MemberListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        children: const [
          MemberWidget(text: '1', numSizeType: true),
          MemberWidget(text: '김사과'),
          MemberWidget(text: '010-1234-5678', phoneType: true),
          MemberWidget(text: '2022-12-30'),
          MemberWidget(text: '5회'),
          MemberWidget(text: '200P'),
        ],
      ),
    );
  }
}
