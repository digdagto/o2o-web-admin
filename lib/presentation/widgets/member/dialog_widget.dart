import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/widgets/custom_toast.dart';
import 'package:o2o_point_configuration/presentation/widgets/member/add_member_inut_widget.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';

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
                            color: AppColors.defaultBlackColor,
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
                                        color: AppColors.primaryOrange,
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
                                    controller: _mobileController,
                                    cursorColor: AppColors.defaultBlackColor,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.primaryOrange,
                                          )),
                                      contentPadding: const EdgeInsets.only(
                                          bottom: 5, right: 16, left: 16),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(4),
                                        borderSide: const BorderSide(
                                            color:
                                                AppColors.textfieldBorderColor),
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
              color: AppColors.textfieldBorderColor,
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
                    .copyWith(fontSize: 18, color: AppColors.defaultBlackColor),
              ),
            ),
          ),
          onTap: () {
            showCustomToast(
              context,
              "회원이 등록되었습니다",
            );
            Navigator.of(context).pop();
          },
        ),
        InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: isTextNotEmpty
                    ? AppColors.primaryOrange
                    : AppColors.defaultGrey3Color,
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
                    builder: (BuildContext context) => AlertDialog(
                          titlePadding: EdgeInsets.zero,
                          contentPadding: EdgeInsets.zero,
                          actionsPadding: EdgeInsets.zero,
                          buttonPadding: EdgeInsets.zero,
                          content: SizedBox(
                            width: 500,
                            height: 267 - 58,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 26.0, bottom: 56),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '이미 등록된 회원 정보입니다.',
                                    style: O2OTheme.lightTheme(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            fontSize: 20,
                                            color: AppColors.defaultBlackColor),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '신규 등록 또는 수정을 원하시는 경우',
                                        style: O2OTheme.lightTheme(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 18,
                                                color:
                                                    AppColors.defaultGreyColor),
                                      ),
                                      Text(
                                        '기존에 등록되어 있는 번호를 삭제해주세요.',
                                        style: O2OTheme.lightTheme(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                                fontSize: 18,
                                                color:
                                                    AppColors.defaultGreyColor),
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
                                  color: AppColors.primaryOrange,
                                ),
                                child: const Text(
                                  '확인',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ))
                : null;
          },
        ),
      ],
    );
  }
}
