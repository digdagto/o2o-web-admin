import 'package:flutter/material.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MemberListTitle extends StatefulWidget {
  const MemberListTitle({
    super.key,
    required this.title,
    this.width,
  });

  final String title;
  final double? width;

  @override
  State<MemberListTitle> createState() => _MemberListTitleState();
}

class _MemberListTitleState extends State<MemberListTitle> {
  bool selected = false;

  //
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: widget.width ??
            (MediaQuery.of(context).size.width - 82) * (311 / 1640),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
            ),
            Text(
              widget.title,
              style: O2OTheme.lightTheme(context).textTheme.labelLarge,
            ),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icon/arrow_up.png',
                    width: 24,
                    color: selected ? AppColors.orangeColor1 : null,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Image.asset(
                    'assets/icon/arrow_down.png',
                    width: 24,
                    color: selected ? AppColors.orangeColor1 : null,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
