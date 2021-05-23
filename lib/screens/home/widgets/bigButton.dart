import 'package:flutter/material.dart';
import 'package:phuc_long_demo/utils/constants.dart';

class BigActionButton extends StatelessWidget {
  const BigActionButton({
    Key? key,
    this.text,
    this.totalPrice,
    this.onTap,
  }) : super(key: key);

  final String? text;
  final double? totalPrice;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: boldButtonColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              totalPrice != null
                  ? Text(
                      totalPrice!.toStringAsFixed(0) + " đ",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
