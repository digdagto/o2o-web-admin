import 'package:flutter/material.dart';

class LeftPanelWidget extends StatelessWidget {
  final BoxConstraints constraints;

  LeftPanelWidget({required this.constraints});

  @override
  Widget build(BuildContext context) {
    var child = ListView.separated(
      separatorBuilder: (BuildContext context, int index) =>
          SizedBox(height: 1),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: index == 0
              ? Row(
            children: [
              SizedBox(
                height: 14,
                child: Image.asset('icon/point.png'),
              ),
              SizedBox(width: 8),
              const Text(
                '포인트 설정',
                style: TextStyle(fontSize: 12, color: Color(0xffe68012)),
              ),
            ],
          )
              : const Text(
            '회원 관리',
            style: TextStyle(fontSize: 12),
          ),
          onTap: () {},
        );
      },
      itemCount: 2,
    );

    double maxWidth = constraints.maxWidth * 0.2;
    double childWidth = 160;
    double width = childWidth > maxWidth ? childWidth : maxWidth;

    return Container(
      width: width,
      child: child,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(width: 1.0, color: Color(0xffdcdfe6)),
        ),
      ),
    );
  }
}
