import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class LoginWithWidget extends StatelessWidget {
  const LoginWithWidget({super.key, required this.buttonText, required this.buttonIcon});

  final String buttonText;
  final String buttonIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).canvasColor,width: 1)
      ),
      child:  Padding(
        padding:  const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(buttonIcon, color: Theme.of(context).canvasColor,),
            const SizedBox(width: 7,),
            Text(buttonText, style: AppStyles.styleRobotoMedium14(context).copyWith(
              color: Theme.of(context).canvasColor
            ),),
          ],
        ),
      ),
    );
  }
}
