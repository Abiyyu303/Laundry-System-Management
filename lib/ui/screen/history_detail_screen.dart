import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HistoryModel args =
        ModalRoute.of(context)!.settings.arguments as HistoryModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HISTORY'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Center(
            child: Text(
              'Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            args.dateString ?? '-',
            style: const TextStyle(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: ColorConstant.pink,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: ColorConstant.grey.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Pick up',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(args.pickupTimeString ?? '-'),
                      const SizedBox(width: 16),
                      Text(
                        args.pickupDateString ?? '-',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    args.title ?? '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  labelWidget(
                    label: 'T-shirt',
                    value: '1',
                  ),
                  const SizedBox(height: 8),
                  labelWidget(
                    label: 'Outer',
                    value: '1',
                  ),
                  const SizedBox(height: 8),
                  labelWidget(
                    label: 'Pants',
                    value: '1',
                  ),
                  const SizedBox(height: 8),
                  labelWidget(
                    label: 'Dress',
                    value: '1',
                  ),
                  const SizedBox(height: 8),
                  labelWidget(
                    label: 'Others',
                    value: '1',
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IntrinsicWidth(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text('Total'),
                              SizedBox(width: 30),
                              Text('5'),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(args.description ?? '-'),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Drop',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(args.dropTimeString ?? '-'),
                      const SizedBox(width: 16),
                      Text(
                        args.dropDateString ?? '-',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  labelWidget(
                    label: args.payment ?? '-',
                    value: args.customerName ?? '-',
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          '${args.totalPayment ?? 0} RM',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget labelWidget({
    required String label,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        const SizedBox(width: 16),
        Text(value),
      ],
    );
  }
}
