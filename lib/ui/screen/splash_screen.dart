import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToLoginScreen();
    super.initState();
  }

  void goToLoginScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              "assets/londry.png",
              width: 200,
              height: 200,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              "CLEAN ME",
              style: TextStyle(
                  fontSize: 50,
                  color: ColorConstant.primary,
                  //fontWeight: FontWeight.bold,
                  // fontFamily: "Tomatoes"
                  ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const CircularProgressIndicator(
            color: ColorConstant.primary,
          )
        ],
      )),
    );
  }
}
