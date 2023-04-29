import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/toast_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class PointChangeDialog extends StatefulWidget {
  const PointChangeDialog({super.key});

  @override
  State<PointChangeDialog> createState() => _PointChangeDialogState();
}

class _PointChangeDialogState extends State<PointChangeDialog> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pointController = TextEditingController();

  bool isTextNotEmpty = false; // 전화번호 입력 유무에 따라 등록 버튼색 변경

  @override
  void dispose() {
    _pointController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      content: SizedBox(
        width: 500,
        height: 198,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 26.0, bottom: 47),
                child: Text(
                  '포인트 적립/차감',
                  style: O2OTheme.lightTheme(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(
                        fontSize: 20,
                        color: AppColors.blackColor1,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '포인트:',
                          style: O2OTheme.lightTheme(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.blackColor1),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 204,
                              height: 40,
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    isTextNotEmpty = value.isNotEmpty;
                                  });
                                },
                                textAlign: TextAlign.end,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  CurrencyInputFormatter(
                                    mantissaLength: 0,
                                    useSymbolPadding: false,
                                  )
                                ],
                                controller: _pointController,
                                cursorColor: AppColors.orangeColor1,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.orangeColor1,
                                      )),
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 5, right: 16, left: 16),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    borderSide: const BorderSide(
                                        color: AppColors.lightGreyColor3),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              width: 59,
                              height: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColors.orangeColor1),
                              child: Text(
                                '적립',
                                style: O2OTheme.lightTheme(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            Container(
                              width: 59,
                              height: 42,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: AppColors.lightGreyColor3)),
                              child: Text(
                                '차감',
                                style: O2OTheme.lightTheme(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(color: AppColors.darkGreyColor1),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '보유 포인트: 10,000P',
                      style: O2OTheme.lightTheme(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.orangeColor1),
                    ),
                  ],
                ),
              )
            ],
          ),
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
            decoration: BoxDecoration(
                color: isTextNotEmpty
                    ? AppColors.orangeColor1
                    : AppColors.lightGreyColor4,
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(3))),
            width: 250,
            height: 58,
            child: Center(
              child: Text(
                '수정',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            if (isTextNotEmpty) {
              showToastWidget(
                const ToastWidget(text: '포인트가 적용되었습니다'),
                context: context,
                animDuration: const Duration(milliseconds: 300),
                animation: StyledToastAnimation.fade,
                reverseAnimation: StyledToastAnimation.fade,
                duration: const Duration(milliseconds: 1200),
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}
