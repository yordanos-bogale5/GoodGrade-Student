import 'package:flutter/material.dart';


import '../../../constants/constant.dart';

class DescSection extends StatelessWidget {
  final String text;
  final TextStyle textStyle;

  const DescSection({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kLessPadding,
        horizontal: kFixPadding,
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}