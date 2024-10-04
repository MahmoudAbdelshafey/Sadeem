import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/authentication_cubit/authentication_cubit.dart';



class CustomSignUpDataBody extends StatelessWidget {
   const CustomSignUpDataBody({super.key ,required this.state});
final state;
  @override
  Widget build(BuildContext context) {

        return SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.9,
            child: PageView.builder(itemBuilder: (context, index) {
              return BlocProvider.of<SignUpDataCubit>(context).screens[index];

            },
              onPageChanged: (index) => BlocProvider.of<SignUpDataCubit>(context).pageChanged(index),


              itemCount: BlocProvider.of<SignUpDataCubit>(context).screens.length,
              controller: BlocProvider.of<SignUpDataCubit>(context).signUpCubitController,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ),
        );

  }
}
