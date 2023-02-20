import 'package:flutter/material.dart';

class QtyButton extends StatefulWidget {
  final Function(int) onChange;
  final int? initialValue;

  const QtyButton({
    Key? key,
    required this.onChange,
    this.initialValue,
  }) : super(key: key);

  @override
  State<QtyButton> createState() => _QtyButtonState();
}

class _QtyButtonState extends State<QtyButton> {
  final TextEditingController _numberController = TextEditingController();
  int _value = 0;

  @override
  void initState() {
    _value = widget.initialValue ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              _value++;
              setState(() {});
            },
            child: const SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                Icons.add,
                color: Colors.black87,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              editNumber();
            },
            child: SizedBox(
              width: 30,
              child: Center(
                child: Text('$_value'),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              if (_value > 0) {
                _value--;
                setState(() {});
              }
            },
            child: const SizedBox(
              width: 30,
              height: 30,
              child: Icon(
                Icons.remove,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void editNumber() async {
    _numberController.text = '$_value';
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Input Number',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: _numberController,
                  maxLength: 3,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '$_value',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onEditingComplete: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        );
      },
    );

    int result = int.tryParse(_numberController.text) ?? 0;
    _value = result > 0 ? result : 0;
    setState(() {});
  }
}
