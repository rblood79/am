import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String label;
  final dynamic textAlign;
  final dynamic alignment;

  const TextWidget({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.label,
    required this.textAlign,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label, // 전달받은 텍스트를 표시
      style: const TextStyle(color: Colors.black, fontSize: 12),
    );
  }
}
