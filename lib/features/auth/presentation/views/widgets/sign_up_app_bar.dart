import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/authentication_cubit/authentication_cubit.dart';
import '../../manager/authentication_cubit/authentication_states.dart';

class SignUpAppBar extends StatelessWidget {
  const SignUpAppBar({super.key, required this.state});
final SignUpState state;
  @override
  Widget build(BuildContext context) {
    return  SliverToBoxAdapter(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.105,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            color: Color.fromRGBO(255, 218, 95, 1),
            ),
          ),
      TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.1, end: BlocProvider.of<SignUpDataCubit>(context).loadingCount  ),
        duration: const Duration(milliseconds: 700),
        builder: (context, value, child) =>Container(
              width: MediaQuery.of(context).size.width * value,
              height: MediaQuery.of(context).size.height*0.105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              color:  Theme.of(context).hintColor,
              ),
            ),
          ),
          Container(

            width: double.infinity,
            height: MediaQuery.of(context).size.height*0.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            color: Theme.of(context).primaryColor,
            ),
            child: state is SignUp_Calculating_Resutls ?  Container(): Row(

              children: [
                InkWell(

                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                    child: Icon(Icons.arrow_back_ios, color: Theme.of(context).canvasColor,),
                  ),
                  onTap: (){
                    BlocProvider.of<SignUpDataCubit>(context).goBackScreen(context);

                  },),
                const Spacer(),
                InkWell(

                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.0,vertical: 40),
                    child: Icon(Icons.language_outlined, color: Theme.of(context).canvasColor,),
                  ),
                  onTap: (){
                    print('clicked lang');
                  },),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
