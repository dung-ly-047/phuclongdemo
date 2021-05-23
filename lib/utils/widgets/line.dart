import 'package:flutter/material.dart';
import 'package:phuc_long_demo/utils/constants.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 2,
        color: bgColor,
      ),
    );
  }
}
