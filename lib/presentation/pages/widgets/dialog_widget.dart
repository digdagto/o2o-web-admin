import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:o2o_point_configuration/presentation/pages/member/widgets/add_member_input_widget.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/error_dialog.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({
    super.key,
  });

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pointController = TextEditingController();

  bool isTextNotEmpty = false; // 전화번호 입력 유무에 따라 등록 버튼색 변경

  @override
  void dispose() {
    _mobileController.dispose();
    _nameController.dispose();
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
        height: 301,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 26.0, bottom: 46),
                    child: Text(
                      '회원 등록',
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 84,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    '* ',
                                    style: TextStyle(
                                        color: AppColors.orangeColor1,
                                        fontSize: 18),
                                  ),
                                  Text(
                                    '전화번호:',
                                    style: O2OTheme.lightTheme(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 300,
                                  height: 40,
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {
                                        isTextNotEmpty = value.isNotEmpty;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      MaskedInputFormatter('000-0000-0000')
                                    ],
                                    controller: _mobileController,
                                    cursorColor: AppColors.orangeColor1,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.orangeColor1,
                                          )),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 5, right: 16, left: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: AppColors.lightGreyColor3),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color: AppColors.lightGreyColor3),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AddMemberInputWidget(
                          inputName: '이름',
                          controller: _nameController,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        AddMemberInputWidget(
                          inputName: '포인트',
                          subButton: '적립',
                          controller: _pointController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              color: AppColors.lightGreyColor3,
            )
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
                '등록',
                style: O2OTheme.lightTheme(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          onTap: () {
            isTextNotEmpty
                ? showDialog(
                    context: context,
                    builder: (BuildContext context) => const ErrorDialog())
                : null;
          },
        ),
      ],
    );
  }
}
