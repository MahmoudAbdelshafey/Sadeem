import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/assets.dart';
import '../../manager/authentication_cubit/authentication_cubit.dart';
import '../../manager/maleOrFemalCubit/maleCubit.dart';
import '../../manager/maleOrFemalCubit/maleState.dart';
import '../widgets/male_female_widget.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.8,
      child: BlocBuilder<MaleCubit , MaleState>(
  builder: (context, state) {
    return Column(
        children: [
          const Spacer(flex: 2,),
           Text('what’s your gender?', style: AppStyles.styleRobotoBold24(context),),
          const SizedBox(height: 50,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             GestureDetector(
                 onTap: (){
                   if(!BlocProvider.of<MaleCubit>(context).isMale){

                     BlocProvider.of<MaleCubit>(context).changeGender();
                   }                 },
                 child: Male_Female_Widget(title: 'Male', image: Assets.imagesMale,selected: BlocProvider.of<MaleCubit>(context).isMale,)),
            const  SizedBox(width: 50,),
             GestureDetector(
                 onTap: (){
                   if(BlocProvider.of<MaleCubit>(context).isMale){

                   BlocProvider.of<MaleCubit>(context).changeGender();
                   }
                 },
                 child: Male_Female_Widget(title: 'Female', image: Assets.imagesFemales,selected: !BlocProvider.of<MaleCubit>(context).isMale,)),
           ],
         ),

          const Spacer(flex: 1,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: CustomButtonWidget(buttonColor:Theme.of(context).primaryColor, buttonTitle: 'Next', textColor: Theme.of(context).canvasColor, buttonFunction: (){
              BlocProvider.of<SignUpDataCubit>(context).changeGender(BlocProvider.of<MaleCubit>(context).isMale);

            }),
          ),
          const Spacer(flex: 2,),

        ],
      );
  },
),
    );
  }
}
