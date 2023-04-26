import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class SubTitleWIdget extends StatelessWidget {
  const SubTitleWIdget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointCubit, PointState>(
      builder: (context, state) {
        return Text(
          title,
          style: O2OTheme.lightTheme(context).textTheme.labelMedium!.copyWith(
                color: state.pointUse
                    ? AppColors.blackColor1
                    : AppColors.darkGreyColor1,
              ),
        );
      },
    );
  }
}
