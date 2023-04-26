import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:o2o_point_configuration/presentation/theme/app_colors.dart';
import 'package:o2o_point_configuration/presentation/theme/o2otheme.dart';

class MainPageLayout extends StatefulWidget {
  const MainPageLayout({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<MainPageLayout> createState() => _MainPageLayoutState();
}

class _MainPageLayoutState extends State<MainPageLayout> {
  String selectedMenu = 'point';
  bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.lightGreyColor2,
          actions: [
            InkWell(
              onTap: () {
                setState(() {
                  showMenu = !showMenu;
                });
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            showMenu
                ? Drawer(
                    backgroundColor: Colors.white,
                    width: 200,
                    elevation: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedMenu = 'point';
                              context.goNamed('point');
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset('assets/icon/point.png',
                                    width: 16,
                                    color: selectedMenu == 'point'
                                        ? AppColors.orangeColor1
                                        : AppColors.darkGreyColor2),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '포인트 설정',
                                  style: O2OTheme.lightTheme(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: selectedMenu == 'point'
                                            ? AppColors.orangeColor1
                                            : AppColors.blackColor1,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedMenu = 'member';
                              context.goNamed('member');
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            padding: const EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Image.asset('assets/icon/member.png',
                                    width: 16,
                                    color: selectedMenu == 'member'
                                        ? AppColors.orangeColor1
                                        : AppColors.darkGreyColor2),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  '회원 관리',
                                  style: O2OTheme.lightTheme(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        color: selectedMenu == 'member'
                                            ? AppColors.orangeColor1
                                            : AppColors.blackColor1,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            Expanded(child: widget.child)
          ],
        ),
      ),
    );
  }
}
