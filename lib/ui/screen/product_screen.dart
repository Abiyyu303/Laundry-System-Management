import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
              'Add details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              Data.products.length,
              (index) => Container(
                margin: EdgeInsets.only(top: index == 0 ? 0 : 16),
                child: CardProduct(
                  product: Data.products[index],
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
          PrimaryButton(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteName.payment,
                arguments: args,
              );
            },
            text: 'ADD',
          ),
        ],
      ),
    );
  }
}
