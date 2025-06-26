import 'package:e_commerce_app/core/color_conversion.dart';
import 'package:e_commerce_app/core/colors.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: size.width / 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Color',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
              Row(
                spacing: 4,
                children: [
                  ...List.generate(widget.colors.length, (index) {
                    final color = widget.colors;
                    return CircleAvatar(
                      backgroundColor: getColorFromName(color[index]),
                      radius: 18,
                      child: InkWell(
                        onTap: () {
                          widget.onColorSelected(index);
                        },
                        child: Icon(
                          size: 18,
                          Icons.check,
                          color: widget.selectedColorIndex == index
                              ? ColorsConst.kWhite
                              : ColorsConst.kTransparent,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 5,
            children: [
              Text(
                'Sizes',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.5,
                ),
              ),
              Row(
                spacing: 4,
                children: [
                  ...List.generate(widget.sizes.length, (index) {
                    final item = widget.sizes;
                    return CircleAvatar(
                      backgroundColor: widget.selectedSizeIndex == index
                          ? ColorsConst.kBlack
                          : ColorsConst.kWhite,
                      radius: 18,
                      child: InkWell(
                        onTap: () {
                          widget.onSizeSelected(index);
                        },
                        child: Text(
                          item[index],
                          style: TextStyle(
                            color: widget.selectedSizeIndex == index
                                ? ColorsConst.kWhite
                                : ColorsConst.kBlack,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
