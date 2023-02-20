import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black54,
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 20),
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 36,
                color: ColorConstant.primary,
              ),
            ),
            const SizedBox(height: 50),
            TextFieldWidget.border(
              controller: nameController,
              hint: 'Name',
              radius: 0,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Name tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
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
              inputType: TextInputType.emailAddress,
              obscureText: true,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Password tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFieldWidget.border(
              controller: confirmPasswordController,
              hint: 'Confirm Password',
              radius: 0,
              inputType: TextInputType.emailAddress,
              obscureText: true,
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return 'Confirm Password tidak boleh kosong';
                }
                if (val != passwordController.text) {
                  return 'Confirm Password dan Password tidak sesuai';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
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

                  if (user != null) {
                    // show dialog user sudah terdaftar
                    showErrorMessageDialog('User sudah terdaftar');
                    return;
                  }

                  // back to login screen
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Register Berhasil"),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              text: 'REGISTER',
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
