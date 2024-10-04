import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../manager/authentication_cubit/authentication_cubit.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget(
      {super.key,
      required this.cardDescription,
      required this.cardIcon,
      required this.cardTitle,
      required this.visible});

  final String cardIcon;
  final String cardTitle;
  final String cardDescription;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (visible) {
          BlocProvider.of<SignUpDataCubit>(context)
              .setWhatBringsYouHere(cardTitle);
        } else {
          BlocProvider.of<SignUpDataCubit>(context).setHowActive(cardTitle);
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2)),
        child: Row(
          children: [

            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(244, 244, 244, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardTitle,
                      style: AppStyles.styleRobotoMedium20(context),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardDescription,
                      style: AppStyles.styleRobotoMedium14(context),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
