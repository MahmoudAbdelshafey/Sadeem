import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../generated/assets.dart';
import '../manager/authentication_cubit/authentication_cubit.dart';
import '../manager/authentication_cubit/authentication_states.dart';
import 'widgets/custom_sign_up_data_body.dart';
import 'widgets/sign_up_app_bar.dart';


class SignUpDataFeature extends StatelessWidget {
  const SignUpDataFeature({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignUpDataCubit, SignUpState>(
        builder: (context, states) {
          return Container(
            // decoration: states is SignUp_Choose_Plan? const BoxDecoration(): const BoxDecoration(
            //     image: DecorationImage(image: AssetImage(Assets.imagesSignUpDataBackground),fit: BoxFit.cover)
            // ),

            child: CustomScrollView(
              slivers: [

                SignUpAppBar(state: states,),
                CustomSignUpDataBody(state: states,)

              ],
            ),
          );
        },
      ),
      // body:  CustomSignUpDataBody(),
    );
  }
}
