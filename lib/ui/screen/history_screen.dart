import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HISTORY'),
      ),
      body: ListView(
        children: [
          Center(
            child: Image.asset(
              'assets/history.png',
              width: 129,
            ),
          ),
          const SizedBox(height: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: List.generate(
              Data.histories.length,
              (index) => Container(
                margin: EdgeInsets.only(top: index == 0 ? 0 : 4),
                child: CardHistory(
                  historyModel: Data.histories[index],
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteName.historyDetail,
                      arguments: Data.histories[index],
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
