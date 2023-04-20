import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:o2o_point_configuration/presentation/bindings/member_controll_binding.dart';
import 'package:o2o_point_configuration/theme/o2otheme.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Uri uri = Uri.parse(window.location.href);
  Map<String, dynamic> queryParameters = Map.from(uri.queryParameters);
  //test
  queryParameters.putIfAbsent('id', () => 'S230000400');
  queryParameters.putIfAbsent('pass', () => '12345678');

  runApp(MyApp(queryParameters: queryParameters));
}

class MyApp extends StatelessWidget {
  final Map<String, dynamic> queryParameters;
  const MyApp({Key? key, required this.queryParameters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: O2OTheme.lightTheme(context),
      darkTheme: O2OTheme.darkTheme(context),
      home: MainPage(queryParameters: queryParameters),
      initialBinding: MemberControllerBinding(queryParameters: queryParameters),
    );
  }
}
