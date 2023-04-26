import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberPage extends StatelessWidget {
  const MemberPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, left: 40, right: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '회원 관리',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                          color: AppColors.blackColor1,
                        ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '총 67 명',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20, color: AppColors.orangeColor1),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 265,
                    height: 40,
                    child: TextField(
                      cursorColor: AppColors.orangeColor1,
                      decoration: InputDecoration(
                        hintText: '전화번호 뒤 4자리',
                        hintStyle: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                              color: AppColors.darkGreyColor1,
                            ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
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
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lightGreyColor3),
                        borderRadius: BorderRadius.circular(4)),
                    width: 80,
                    height: 42,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icon/search.png',
                          width: 16,
                        ),
                        Text('검색',
                            style: O2OTheme.lightTheme(context)
                                .textTheme
                                .bodyLarge)
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
