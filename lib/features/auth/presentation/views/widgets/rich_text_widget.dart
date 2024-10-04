import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class RichTextButton extends StatelessWidget {
  final Color? color1;
  final String? text2;
  final Color? color2;
  final VoidCallback? onPressed1;
  final bool isBorder;
  final AlignmentGeometry? alignment;

  const RichTextButton({
    super.key,
    this.color1,
    this.text2,
    this.color2,
    this.onPressed1,
    this.isBorder = false,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isBorder
          ? const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      )
          : null,
      width: double.infinity,
      alignment: alignment,
      decoration: isBorder
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.fromBorderSide(
          BorderSide(
            color: Colors.grey.withOpacity(0.6),
          ),
        ),
      )
          : null,
      child: Text.rich(
        TextSpan(
          text: 'Resend',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: color1,
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed1,
          children: [
            const TextSpan(
              text: ' ',
            ),
            TextSpan(
              text: text2,
              style: AppStyles.styleRobotoBold24(context).copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: 14
              )
            ),
          ],
        ),
      ),
    );
  }
}