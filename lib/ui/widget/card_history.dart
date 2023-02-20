import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class CardHistory extends StatelessWidget {
  final HistoryModel historyModel;
  final Function()? onTap;

  const CardHistory({
    Key? key,
    required this.historyModel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: ColorConstant.pink, width: 1),
            bottom: BorderSide(color: ColorConstant.pink, width: 1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(historyModel.timeString ?? '-'),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    historyModel.dateString ?? '-',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.keyboard_arrow_right),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
