import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.onSectionTap,
  });

  final ValueChanged<int> onSectionTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () => onSectionTap(1),
            child: const Text('Seção 1'),
          ),
          TextButton(
            onPressed: () => onSectionTap(2),
            child: const Text('Seção 2'),
          ),
          TextButton(
            onPressed: () => onSectionTap(3),
            child: const Text('Seção 3'),
          ),
        ],
      ),
    );
  }
}
