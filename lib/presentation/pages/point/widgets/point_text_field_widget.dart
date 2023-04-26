import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class PointTextFieldWidget extends StatelessWidget {
  const PointTextFieldWidget({
    super.key,
    required this.title,
    required this.width,
    required this.lastText,
    required this.textEditingController,
    required this.validate,
  });

  final String title; // 입력창 명
  final double width; //  입력창 길이
  final String lastText; // 입력창 단위

  final TextEditingController textEditingController;

  final bool validate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 352,
      height: 61,
      child: Stack(
        children: [
          BlocBuilder<PointCubit, PointState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(
                            color: state.pointUse
                                ? AppColors.darkGreyColor3
                                : AppColors.darkGreyColor1),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width,
                        height: 33,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            CurrencyInputFormatter(
                              mantissaLength: 0,
                              useSymbolPadding: false,
                            )
                          ],
                          controller: textEditingController,
                          enabled: state.pointUse,
                          textAlign: TextAlign.end,
                          cursorColor: AppColors.orangeColor1,
                          style:
                              O2OTheme.lightTheme(context).textTheme.bodyLarge,
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                  color: AppColors.orangeColor1),
                            ),
                            errorStyle: const TextStyle(height: 0),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide:
                                  const BorderSide(color: AppColors.redColor1),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                  color: AppColors.lightGreyColor3),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                  color: AppColors.lightGreyColor3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(2),
                              borderSide: const BorderSide(
                                  color: AppColors.orangeColor1),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 6),
                          ),
                          validator: (value) {
                            if (value == null || value == '') {
                              return '';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        lastText,
                        style: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(
                                color: state.pointUse
                                    ? AppColors.darkGreyColor3
                                    : AppColors.darkGreyColor1),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          validate
              ? Positioned(
                  bottom: 7,
                  right: 22,
                  child: Text(
                    '필수 입력 내용입니다.',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppColors.redColor1),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
