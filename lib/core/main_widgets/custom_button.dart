import 'package:flutter/material.dart';

import '../utils/app_styles.dart';


class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key,  this.buttonColor, required this.buttonTitle,  this.textColor, required this.buttonFunction});
final String buttonTitle;
final Color? buttonColor;
final Color? textColor;
final void Function()? buttonFunction;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonFunction,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8),

        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor ?? Theme.of(context).primaryColor,
        ),
        child: Text(buttonTitle,
          textAlign: TextAlign.center,
          style: AppStyles.styleRobotoMedium20(context).copyWith(
            color: textColor ?? Theme.of(context).disabledColor
          ),),
      ),
    );
  }
}
