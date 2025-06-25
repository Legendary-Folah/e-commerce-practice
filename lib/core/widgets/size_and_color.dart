import 'package:flutter/material.dart';

class SizeAndColor extends StatefulWidget {
  final List<dynamic> colors;
  final List<dynamic> sizes;
  final Function(int) onColorSelected;
  final Function(int) onSizeSelected;
  final int selectedColorIndex;
  final int selectedSizeIndex;

  const SizeAndColor({
    super.key,
    required this.colors,
    required this.sizes,
    required this.onColorSelected,
    required this.onSizeSelected,
    required this.selectedColorIndex,
    required this.selectedSizeIndex,
  });

  @override
  State<SizeAndColor> createState() => _SizeAndColorState();
}

class _SizeAndColorState extends State<SizeAndColor> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(crossAxisAlignment: CrossAxisAlignment.start);
  }
}
