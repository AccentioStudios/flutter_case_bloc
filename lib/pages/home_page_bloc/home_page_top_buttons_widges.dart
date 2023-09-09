import 'package:flutter/material.dart';

class HomePageTopButtonsWidget extends StatelessWidget {
  const HomePageTopButtonsWidget({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ActionChip(
        label: const Text('01001000'),
        onPressed: () => textController.text = '01001000',
      ),
      const SizedBox(width: 8),
      ActionChip(
        label: const Text('01001001'),
        onPressed: () => textController.text = '01001001',
      ),
      const SizedBox(width: 8),
      ActionChip(
        label: const Text('01001010'),
        onPressed: () => textController.text = '01001010',
      ),
    ]);
  }
}