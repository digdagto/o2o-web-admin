import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/pages/member/member_page.dart';
import 'package:o2o_point_configuration/presentation/pages/point/point_page.dart';
import 'package:o2o_point_configuration/presentation/pages/widgets/main_page_layout.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final routers = GoRouter(
  // redirect: (context, state) {
  //   return null;
  // },

  initialLocation: '/point',
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      pageBuilder: (context, state, child) => MaterialPage(
        child: MainPageLayout(child: child),
      ),
      routes: [
        GoRoute(
          name: 'point',
          path: '/point',
          pageBuilder: (context, state) {
            return MaterialPage(
                child: BlocProvider(
              create: (context) => PointCubit(),
              child: const PointPage(),
            ));
          },
        ),
        GoRoute(
          name: 'member',
          path: '/member',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MemberPage());
          },
        ),
      ],
    ),
  ],
);
