import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:o2o_point_configuration/presentation/blocs/auth/auth_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/auth/auth_event.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/pages/point/widgets/point_radio_widget.dart';
import 'package:o2o_point_configuration/presentation/pages/point/widgets/point_text_field_widget.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/sub_title_widget.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class PointPage extends StatefulWidget {
  const PointPage({super.key});

  @override
  State<PointPage> createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  final int _periodRadio = 4;
  bool validate = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController paymentRateEditingController =
      TextEditingController();
  final TextEditingController minPointEditingController =
      TextEditingController();
  final TextEditingController maxPointEditingController =
      TextEditingController();
  final TextEditingController minUseEditingController = TextEditingController();
  final TextEditingController maxUseEditingController = TextEditingController();

  @override
  void initState() {
    Uri uri = Uri.parse(window.location.href);
    Map<String, dynamic> queryParameters = Map.from(uri.queryParameters);
    //test
    queryParameters.putIfAbsent('id', () => 'S230000400');
    queryParameters.putIfAbsent('pass', () => '12345678');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<AuthenticationBloc>(context).add(Login(id: queryParameters['id'], pass: queryParameters['pass']));
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0, left: 40, right: 40),
      child: BlocBuilder<PointCubit, PointState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '포인트 설정',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                          color: AppColors.blackColor1,
                        ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SubTitleWIdget(title: '포인트 사용 여부'),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: 49,
                    height: 26,
                    child: FlutterSwitch(
                      inactiveColor: AppColors.lightGreyColor5,
                      activeColor: AppColors.orangeColor1,
                      padding: 4,
                      toggleSize: 18.0,
                      borderRadius: 13,
                      width: 49,
                      height: 26,
                      value: state.pointUse,
                      onToggle: (value) {
                        context.read<PointCubit>().pointUseChange();
                        setState(() {
                          validate = false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 51,
                  ),
                  const SubTitleWIdget(title: '유효기간'),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      PointRadioWidget(radioTitle: '1년', radioValue: 0),
                      SizedBox(
                        width: 60,
                      ),
                      PointRadioWidget(radioTitle: '2년', radioValue: 1),
                      SizedBox(
                        width: 60,
                      ),
                      PointRadioWidget(radioTitle: '3년', radioValue: 2),
                      SizedBox(
                        width: 60,
                      ),
                      PointRadioWidget(radioTitle: '4년', radioValue: 3),
                      SizedBox(
                        width: 60,
                      ),
                      PointRadioWidget(radioTitle: '5년', radioValue: 4),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SubTitleWIdget(
                          title: '적립 방식',
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        PointTextFieldWidget(
                          title: '결제 금액의',
                          width: 57,
                          lastText: '%',
                          textEditingController: paymentRateEditingController,
                          validate: validate,
                        ),
                        PointTextFieldWidget(
                          title: '최소 적립 가능 금액',
                          width: 140,
                          lastText: '원',
                          textEditingController: minPointEditingController,
                          validate: validate,
                        ),
                        PointTextFieldWidget(
                          title: '최대 적립 가능 금액',
                          width: 140,
                          lastText: '원',
                          textEditingController: maxPointEditingController,
                          validate: validate,
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        const SubTitleWIdget(title: '사용 방식'),
                        const SizedBox(
                          height: 12,
                        ),
                        PointTextFieldWidget(
                          title: '최소 사용 가능 포인트',
                          width: 140,
                          lastText: 'P',
                          textEditingController: minUseEditingController,
                          validate: validate,
                        ),
                        PointTextFieldWidget(
                          title: '최대 사용 가능 포인트',
                          width: 140,
                          lastText: 'P',
                          textEditingController: maxUseEditingController,
                          validate: validate,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 27,
              ),
              InkWell(
                onTap: () {
                  if (state.pointUse && _formKey.currentState != null) {
                    if (_formKey.currentState!.validate()) {
                      showToast('저장이 완료되었습니다');
                      return;
                    }
                    showToastWidget(
                      Padding(
                        padding: const EdgeInsets.only(bottom: 64.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.darkGreyColor2,
                              borderRadius: BorderRadius.circular(31)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 60.0, vertical: 18),
                            child: Text(
                              '저장이 완료되었습니다',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      context: context,
                      animDuration: const Duration(milliseconds: 300),
                      animation: StyledToastAnimation.fade,
                      reverseAnimation: StyledToastAnimation.fade,
                      duration: const Duration(milliseconds: 1200),
                    );
                    setState(() {
                      validate = true;
                    });
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 59,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.orangeColor1,
                  ),
                  child: Text(
                    '저장',
                    style: O2OTheme.lightTheme(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
