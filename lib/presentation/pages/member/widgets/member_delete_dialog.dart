import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:go_router/go_router.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/toast_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDeleteDialog extends StatelessWidget {
  const MemberDeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        height: 209,
        child: Column(
          children: [
            const SizedBox(
              height: 26,
            ),
            Text(
              '회원을 삭제하시겠습니까?',
              style: O2OTheme.lightTheme(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontSize: 20),
            ),
            const SizedBox(
              height: 46,
            ),
            Text(
              '회원 삭제 시 저장된 데이터는 사라지며',
              style: O2OTheme.lightTheme(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                      fontSize: 18,
                      color: AppColors.darkGreyColor3,
                      fontWeight: FontWeight.w400),
            ),
            Text(
              '복구가 불가능합니다.',
              style: O2OTheme.lightTheme(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(
                      fontSize: 18,
                      color: AppColors.darkGreyColor3,
                      fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        InkWell(
          child: SizedBox(
            width: 250,
            height: 58,
            child: Center(
              child: Text(
                '취소',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, color: AppColors.blackColor1),
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        InkWell(
          child: Container(
            decoration: const BoxDecoration(
                color: AppColors.orangeColor1,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(3))),
            width: 250,
            height: 58,
            child: Center(
              child: Text(
                '삭제',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            showToastWidget(
              const ToastWidget(text: '회원이 삭제되었습니다'),
              context: context,
              animDuration: const Duration(milliseconds: 300),
              animation: StyledToastAnimation.fade,
              reverseAnimation: StyledToastAnimation.fade,
              duration: const Duration(milliseconds: 1200),
            );
            Navigator.of(context).pop();
            context.goNamed('member');
          },
        ),
      ],
    );
  }
}
