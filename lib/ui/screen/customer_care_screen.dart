import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class CustomerCareScreen extends StatefulWidget {
  const CustomerCareScreen({Key? key}) : super(key: key);

  @override
  State<CustomerCareScreen> createState() => _CustomerCareScreenState();
}

class _CustomerCareScreenState extends State<CustomerCareScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CUSTOMER CARE'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Image.asset(
              'assets/cs.png',
              width: 129,
            ),
          ),
          const SizedBox(height: 28),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorConstant.pink,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFieldWidget.filled(
                  controller: nameController,
                  label: 'Name',
                  radius: 10,
                ),
                const SizedBox(height: 8),
                TextFieldWidget.filled(
                  controller: emailController,
                  label: 'Email',
                  radius: 10,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 8),
                TextFieldWidget.filled(
                  controller: phoneController,
                  label: 'Phone',
                  radius: 10,
                  inputType: TextInputType.phone,
                ),
                const SizedBox(height: 8),
                TextFieldWidget.filled(
                  controller: descriptionController,
                  label: 'Description',
                  radius: 10,
                  maxLines: 7,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 20),
          PrimaryButton(
            onTap: () {
              // back to home screen
              Navigator.of(context).popUntil((route) => route.isFirst);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sent Successfully"),
                  duration: Duration(seconds: 1),
                ),
              );

            },
            text: 'SENT',
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                FlutterPhoneDirectCaller.callNumber('911');
              },
              child: const Text(
                'Or you can call now ?',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorConstant.pink,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
