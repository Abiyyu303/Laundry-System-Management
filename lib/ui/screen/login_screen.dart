import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstant.primary,
        elevation: 30,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              print("klik search");
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              print("klik settings");
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            print("klik home");
          },
        ),
        shadowColor: ColorConstant.primary,
        title: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 40),
            const Text(
              'Log in',
              style: TextStyle(
                fontSize: 36,
                color: ColorConstant.primary,
              ),
            ),
            const SizedBox(height: 50),
            TextFieldWidget.border(
              controller: emailController,
              hint: 'Email Address',
              radius: 0,
              inputType: TextInputType.emailAddress,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Email tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFieldWidget.border(
              controller: passwordController,
              hint: 'Password',
              radius: 0,
              obscureText: true,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.register);
                },
                child: const Text(
                  'Create a new account',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            PrimaryButton(
              onTap: () {
                // hide keyboard
                FocusScope.of(context).unfocus();

                // check validasi
                if (formKey.currentState?.validate() ?? false) {
                  // check apakah user tersedia
                  UserModel? user = Data.users.firstWhereOrNull(
                    (u) => u.email == emailController.text,
                  );

                  if (user == null) {
                    // show dialog user tidak terdaftar
                    showErrorMessageDialog('User tidak terdaftar');
                    return;
                  }

                  if (user.password != passwordController.text) {
                    // show dialog password salah
                    showErrorMessageDialog('Email & Password tidak sesuai');
                    return;
                  }

                  // go to home screen
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteName.home,
                    (route) => false,
                    arguments: user,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Login Berhasil"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              text: 'LOG IN',
            ),
          ],
        ),
      ),
    );
  }

  void showErrorMessageDialog(String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
