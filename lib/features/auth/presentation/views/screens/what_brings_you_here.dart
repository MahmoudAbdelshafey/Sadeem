import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/authentication_cubit/authentication_cubit.dart';
import '../widgets/custom_card_widget.dart';

class WhatBringsYouScreen extends StatelessWidget {
  const WhatBringsYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         SizedBox( height:  MediaQuery.of(context).size.height*0.1,),
         Text('what brings you here?', style: AppStyles.styleRobotoBold24(context),),
         // SizedBox( height:  MediaQuery.of(context).size.height*0.05,),
        Expanded(
          child: SizedBox(
            width: MediaQuery.of(context).size.width *0.9,
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: CustomCardWidget(cardDescription: BlocProvider.of<SignUpDataCubit>(context).cardModels[index].cardDescription, cardIcon: BlocProvider.of<SignUpDataCubit>(context).cardModels[index].cardIcon, cardTitle: BlocProvider.of<SignUpDataCubit>(context).cardModels[index].cardTitle, visible: BlocProvider.of<SignUpDataCubit>(context).cardModels[index].visible,),
              );
            },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: BlocProvider.of<SignUpDataCubit>(context).cardModels.length,
            ),
          ),
        ),
      ],
    );
  }
}
