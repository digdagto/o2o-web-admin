import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:go_router/go_router.dart';
import 'package:o2o_point_configuration/data/repositories/point_configuration_impl.dart';
import 'package:o2o_point_configuration/data/services/auth_service_impl.dart';
import 'package:o2o_point_configuration/presentation/blocs/auth/auth_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/congifuration/configuration_bloc.dart';
import 'package:o2o_point_configuration/presentation/blocs/congifuration/configuration_event.dart';
import 'package:o2o_point_configuration/presentation/blocs/cubit/point_cubit.dart';
import 'package:o2o_point_configuration/presentation/blocs/firebaseLogin/firebase_login_bloc.dart';
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
            Uri uri = Uri.parse(window.location.href);
            Map<String, dynamic> queryParameters = Map.from(uri.queryParameters);
            //test
            queryParameters.putIfAbsent('id', () => 'S230000400');
            queryParameters.putIfAbsent('pass', () => '12345678');
            String collectionPath =
                "pos_v2/${int.parse(queryParameters['id'].substring(3)) - 1}/configuration";
            final firebaseLoginBloc = FirebaseLoginBloc();
            final authService = AuthServiceImpl(firebaseLoginBloc: firebaseLoginBloc);


            return MaterialPage(
                child: MultiBlocProvider(
                providers: [
                    BlocProvider(
                    create: (context) => PointCubit(),
                    ),
                  BlocProvider<ConfigurationBloc>(
                    create: (context) => ConfigurationBloc(
                      pointConfigRepo: PointConfigurationRepositoryImpl(collectionPath),
                    )..add(LoadInitialValues()),
                  ),
            BlocProvider(
            create: (context) => AuthenticationBloc(authService: authService),
            )
                ],
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
