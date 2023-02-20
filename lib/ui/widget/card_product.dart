import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class CardProduct extends StatefulWidget {
  final ProductModel product;

  const CardProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends State<CardProduct> {
  final List<String> categories = ['Man', 'Woman'];

  late String selectedCategory;

  @override
  void initState() {
    selectedCategory = widget.product.category ?? categories.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          widget.product.icon!,
          width: 76,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedCategory,
                  items: categories
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ),
                      )
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedCategory = val.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        QtyButton(
          onChange: (val) {},
        ),
      ],
    );
  }
}
