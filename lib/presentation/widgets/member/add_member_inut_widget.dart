import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/theme/app_colors.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';

class AddMemberInputWidget extends StatelessWidget {
  const AddMemberInputWidget({
    super.key,
    this.requiredIcon = false,
    required this.inputName,
    this.subButton = '',
    required this.controller,
  });

  final bool requiredIcon;
  final String inputName;
  final String subButton;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 84,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              requiredIcon
                  ? const Text(
                      '* ',
                      style: TextStyle(
                          color: AppColors.primaryOrange, fontSize: 18),
                    )
                  : Container(),
              Text(
                '$inputName:',
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
              width: subButton == '' ? 300 : 238,
              height: 40,
              child: TextField(
                controller: controller,
                cursorColor: AppColors.defaultBlackColor,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: AppColors.primaryOrange,
                      )),
                  contentPadding:
                      const EdgeInsets.only(bottom: 5, right: 16, left: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide:
                        const BorderSide(color: AppColors.textfieldBorderColor),
                  ),
                ),
              ),
            ),
            subButton == ''
                ? Container()
                : Container(
                    alignment: Alignment.center,
                    width: 62,
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {},
                      child: Text(
                        subButton,
                        style: O2OTheme.lightTheme(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.primaryOrange),
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
