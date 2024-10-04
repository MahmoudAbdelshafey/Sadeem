import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../utils/app_styles.dart';


class AuthTopWidget extends StatelessWidget {
  const AuthTopWidget({super.key,required this.designTitle});
final String designTitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.gifWallpaper3,), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(120))
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            height: 190,
            width: double.infinity,
            decoration:   BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius:const  BorderRadius.only(bottomRight: Radius.circular(120))
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 2),
              child: Text(designTitle, style: AppStyles.styleRobotoSemiBold40(context)),
            ),
          ),
          Container(
            height: 140,
            decoration:  BoxDecoration(
                image: DecorationImage(image: AssetImage(Assets.gifWallpaper3,), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(120))
            ),
          ),
          Container(
            height: 130,
            decoration:  BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(120))
            ),

          ),
          Container(
            height: 123,
            decoration: BoxDecoration(

                image: DecorationImage(image: AssetImage(Assets.imagesNotApp,), fit: BoxFit.cover),
                borderRadius: const BorderRadius.only(bottomRight: Radius.circular(120))
            ),
          ),

        ],
      ),
    );
  }
}
