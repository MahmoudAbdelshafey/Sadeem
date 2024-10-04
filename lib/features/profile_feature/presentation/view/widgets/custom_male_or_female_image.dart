import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';


class CustomMaleOrFemaleImage extends StatelessWidget {
  const CustomMaleOrFemaleImage({super.key, required this.isMale, required this.accountName});
  final String accountName;
  final bool isMale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.4,
      height: MediaQuery.of(context).size.height *0.25,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.4,
            height: MediaQuery.of(context).size.height *0.2,
            decoration:  BoxDecoration(
              image: isMale? const DecorationImage(image: AssetImage(Assets.imagesMale)) : const DecorationImage(image:  AssetImage(Assets.imagesFemales)),
            ),
          ),
          Text(accountName, style: AppStyles.styleInterMedium25(context),)
        ],
      ),
    );
  }
}
