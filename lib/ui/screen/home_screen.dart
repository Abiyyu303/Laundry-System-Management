import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel args =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Welcome'),
            const SizedBox(height: 4),
            Text(
              args.name ?? '-',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                  child: MenuWidget(
                    icon: 'assets/wash_iron.png',
                    name: 'Wash & Iron',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.product,
                        arguments: 'Wash & Iron',
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MenuWidget(
                    icon: 'assets/iron.png',
                    name: 'Iron',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.product,
                        arguments: 'Iron',
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: MenuWidget(
                    icon: 'assets/history.png',
                    name: 'History',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.history);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: MenuWidget(
                    icon: 'assets/cs.png',
                    name: 'Customer Care',
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.customerCare);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              onTap: () {},
              text: 'NEXT',
            ),
          ],
        ),
      ),
    );
  }
}
