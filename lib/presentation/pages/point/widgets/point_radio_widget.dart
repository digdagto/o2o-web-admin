import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class PointRadioWidget extends StatelessWidget {
  const PointRadioWidget(
      {super.key, required this.radioTitle, required this.radioValue});

  final String radioTitle;
  final int radioValue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointCubit, PointState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              radioTitle,
              style: O2OTheme.lightTheme(context).textTheme.bodyLarge!.copyWith(
                  color: state.pointUse
                      ? AppColors.darkGreyColor3
                      : AppColors.darkGreyColor1),
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: Radio(
                activeColor: AppColors.orangeColor1,
                value: state.pointUse ? radioValue : null,
                groupValue: state.period,
                onChanged: (value) {
                  state.pointUse
                      ? context
                          .read<PointCubit>()
                          .pointPeriodChange(int.parse(value.toString()))
                      : null;
                },
              ),
            )
          ],
        );
      },
    );
  }
}
