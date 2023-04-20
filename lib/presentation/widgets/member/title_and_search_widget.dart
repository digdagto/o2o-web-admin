import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';

class TitleAndSearchWidget extends StatelessWidget {
  const TitleAndSearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1640,
      child: Row(
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
                      color: AppColors.defaultBlackColor,
                    ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                '총 67 명',
                style:
                    O2OTheme.lightTheme(context).textTheme.labelSmall!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.textfieldBorderColor,
                  ),
                ),
                width: 265,
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '전화번호 뒤 4자리',
                    contentPadding: const EdgeInsets.only(left: 16),
                    hintStyle: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                          color: AppColors.hintTextColor,
                        ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                height: 42,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: AppColors.textfieldBorderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/search.png',
                      width: 16,
                      height: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '검색',
                      style: O2OTheme.lightTheme(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.defaultGreyColor),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
