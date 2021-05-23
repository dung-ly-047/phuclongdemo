import 'package:flutter/material.dart';
import 'package:phuc_long_demo/utils/constants.dart';

class TabWidget extends StatelessWidget {
  final String? text;

  TabWidget({
    Key? key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        text!,
        style: TextStyle(
          color: lightTextColor,
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
      ),
    );
  }
}
