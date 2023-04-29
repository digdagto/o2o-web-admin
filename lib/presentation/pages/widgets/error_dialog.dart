import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/toast_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        height: 267 - 58,
        child: Padding(
          padding: const EdgeInsets.only(top: 26.0, bottom: 56),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이미 등록된 회원 정보입니다.',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 20, color: AppColors.blackColor1),
              ),
              Column(
                children: [
                  Text(
                    '신규 등록 또는 수정을 원하시는 경우',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            fontSize: 18, color: AppColors.darkGreyColor3),
                  ),
                  Text(
                    '기존에 등록되어 있는 번호를 삭제해주세요.',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            fontSize: 18, color: AppColors.darkGreyColor3),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            showToastWidget(
              const ToastWidget(text: '회원 정보 수정이 완료되었습니다'),
              context: context,
              animDuration: const Duration(milliseconds: 300),
              animation: StyledToastAnimation.fade,
              reverseAnimation: StyledToastAnimation.fade,
              duration: const Duration(milliseconds: 1200),
            );
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            width: 500,
            height: 58,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(3),
                bottomLeft: Radius.circular(3),
              ),
              color: AppColors.orangeColor1,
            ),
            child: const Text(
              '확인',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
