import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class MenuWidget extends StatelessWidget {
  final String name;
  final String icon;
  final Function() onTap;

  const MenuWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: ColorConstant.pink,
                ),
              ),
              child: Image.asset(
                icon,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
