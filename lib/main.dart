import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorConstant.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorConstant.primary,
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteConfig.onGenerateRoute,
    );
  }
}
