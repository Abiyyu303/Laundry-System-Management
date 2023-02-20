import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedIndex = 0;

  final List<Widget> _children = [
    const CODForm(),
    const TransferForm(),
  ];

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(args),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              'Payment',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          color: ColorConstant.primary,
                          padding: const EdgeInsets.all(20),
                          child: Image.asset('assets/cod.png'),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'COD',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Icon(
                        selectedIndex == 0
                            ? Icons.circle
                            : Icons.circle_outlined,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 60),
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          color: ColorConstant.pink,
                          padding: const EdgeInsets.all(20),
                          child: Image.asset('assets/transfer.png'),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Transfer',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Icon(
                        selectedIndex == 1
                            ? Icons.circle
                            : Icons.circle_outlined,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          _children[selectedIndex],
          const SizedBox(height: 30),
          PrimaryButton(
            onTap: () {
              // back to home screen
              Navigator.of(context).popUntil((route) => route.isFirst);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Transaction Successfully"),
                  duration: Duration(seconds: 1),
                ),
              );

            },
            text: 'ADD',
          ),
        ],
      ),
    );
  }
}

class CODForm extends StatefulWidget {
  const CODForm({Key? key}) : super(key: key);

  @override
  State<CODForm> createState() => _CODFormState();
}

class _CODFormState extends State<CODForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFieldWidget.border(
          controller: nameController,
          label: 'Name',
          radius: 0,
        ),
        const SizedBox(height: 12),
        TextFieldWidget.border(
          controller: addressController,
          label: 'Address',
          radius: 0,
        ),
        const SizedBox(height: 12),
        TextFieldWidget.border(
          controller: dateTimeController,
          label: 'Date & time',
          radius: 0,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

class TransferForm extends StatefulWidget {
  const TransferForm({Key? key}) : super(key: key);

  @override
  State<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends State<TransferForm> {
  final TextEditingController cardHolderNameController =
      TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardExpiryDateController =
      TextEditingController();
  final TextEditingController cardCvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'ADD CARD',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 8),
              Icon(
                Icons.keyboard_arrow_down,
              )
            ],
          ),
        ),
        const SizedBox(height: 40),
        TextFieldWidget.border(
          controller: cardHolderNameController,
          label: 'Card Holder Name',
          radius: 19,
        ),
        const SizedBox(height: 12),
        TextFieldWidget.border(
          controller: cardNumberController,
          label: 'Card Number',
          inputType: TextInputType.number,
          radius: 19,
        ),
        const SizedBox(height: 12),
        TextFieldWidget.border(
          controller: cardExpiryDateController,
          label: 'Card Holder Name',
          radius: 19,
        ),
        const SizedBox(height: 12),
        TextFieldWidget.border(
          controller: cardCvvController,
          label: 'CVV/CVC',
          inputType: TextInputType.number,
          obscureText: true,
          radius: 19,
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
