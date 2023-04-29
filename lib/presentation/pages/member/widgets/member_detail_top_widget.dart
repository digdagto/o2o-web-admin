import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_detail_subtitle_widget.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/member_update_dialog.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/point_change_dialog.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberDetailTopWidget extends StatelessWidget {
  const MemberDetailTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '사용 내역',
          style: O2OTheme.lightTheme(context).textTheme.displayMedium!.copyWith(
                color: AppColors.blackColor1,
              ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 206 - 94 - 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const MemberDetailSubtitleWidget(title: '이름:', content: '홍길동'),
              const MemberDetailSubtitleWidget(title: '방문 수:', content: '38회'),
              Row(
                children: [
                  const MemberDetailSubtitleWidget(
                      title: '보유 포인트:', content: '10,000P'),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PointChangeDialog(),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 95,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.lightGreyColor3)),
                      child: Text(
                        '적립/차감',
                        style: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.darkGreyColor3),
                      ),
                    ),
                  )
                ],
              ),
              Tooltip(
                triggerMode: TooltipTriggerMode.tap,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: const TextStyle(
                  fontSize: 16,
                ),
                message: '30일 내, 소멸 예정 포인트',
                child: Row(
                  children: const [
                    Icon(
                      Icons.help_outline_rounded,
                      size: 18,
                      color: AppColors.darkGreyColor1,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    MemberDetailSubtitleWidget(
                        title: '소멸 예정 포인트:', content: '200P'),
                  ],
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 265,
                    height: 40,
                    child: TextField(
                      style: O2OTheme.lightTheme(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(
                            fontSize: 18,
                          ),
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        MaskedInputFormatter('000-0000-0000'),
                      ],
                      textAlign: TextAlign.left,
                      cursorColor: AppColors.orangeColor1,
                      decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: '010-1234-5678',
                        hintStyle: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                              color: AppColors.darkGreyColor1,
                              fontSize: 18,
                            ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 71,
                        ),
                        border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.lightGreyColor3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.lightGreyColor3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.orangeColor1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const MemberUpdateDialog(),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 59,
                      height: 42,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppColors.lightGreyColor3)),
                      child: Text(
                        '수정',
                        style: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.darkGreyColor3),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
