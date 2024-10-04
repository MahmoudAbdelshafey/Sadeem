import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';


import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../manager/calculating_results/calculation_result_cubit.dart';
import '../../manager/calculating_results/calculation_result_state.dart';
import '../widgets/progress_animation.dart';

class CalculationResults extends StatelessWidget {
  const CalculationResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationResultCubit, CalculatingResult>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProgresssAnimation(
                progRadius: 105,
                loadCount: 1,
                state: state,
                showData: true,
                animationChild: CircleAvatar(
                  backgroundColor: Theme.of(context).disabledColor,
                  radius: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(Assets.lottieThird, width: 150),

                      Text(
                        '${(BlocProvider.of<CalculationResultCubit>(context).percent).toInt()} %',
                        style: AppStyles.styleRobotoSemiBold40(context).copyWith(color: Theme.of(context).cardColor),
                      ),
                    ],
                  ),
                ),
                progressFun: () {
                  BlocProvider.of<CalculationResultCubit>(context)
                      .gotoNavigate(context);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Calculating Results',
                style: AppStyles.styleRobotoSemiBold40(context).copyWith(fontSize: 28),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child:  Text(
                  'our algorithm is finding the perfect data and info for you',
                  textAlign: TextAlign.center,
                  style: AppStyles.styleRobotoRegular22(context).copyWith(color: Theme.of(context).cardColor),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
