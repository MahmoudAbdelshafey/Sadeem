import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/main_widgets/custom_button.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import '../manager/auth_cubit/auth_cubit.dart';

import 'login_view.dart';
import 'signup_view.dart';
import 'widgets/login_with_external_widget.dart';

class LandingViewMobileLayOut extends StatelessWidget {
  const LandingViewMobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height*1,
          decoration: const BoxDecoration(
              image: DecorationImage(

                  image: AssetImage(
                    Assets.gifWallpaper4,
                  ),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              const Row(),
              const Spacer(
                flex: 1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Image.asset(Assets.imagesSmallLogoWhite),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomButtonWidget(
                buttonTitle: 'Login',
                textColor: Theme.of(context).primaryColor,
                buttonColor: Theme.of(context).disabledColor,
                buttonFunction: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const LoginViewMobileLayOut(),
                      ));


                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonWidget(
                buttonColor: Theme.of(context).primaryColor,
                buttonTitle: 'SignUp',
                buttonFunction: (){
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const SignUpMobileLayOut(),
                      ));
              },),
              const SizedBox(
                height: 30,
              ),
               Text(
                'OR YOU CAN',
                style: AppStyles.styleRobotoMedium14(context),
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () async {
                  BlocProvider.of<AuthCubit>(context).signInWithGoogle(context);
                },
                child: const LoginWithWidget(
                    buttonText: 'Continue with Gmail',
                    buttonIcon: Assets.iconsGmailIcon,),
              ),
              const SizedBox(
                height: 18,
              ),

              GestureDetector(
                onTap:()async{
                  BlocProvider.of<AuthCubit>(context).singInWithApple();
                },
                child: const LoginWithWidget(
                    buttonText: 'Continue with Apple',
                    buttonIcon: Assets.iconsAppleIcon),
              ),
              const SizedBox(
                height: 18,
              ),

              GestureDetector(

                onTap:()async{
                  BlocProvider.of<AuthCubit>(context).signInWithFacebook();
                },

                child: const LoginWithWidget(
                    buttonText: 'Continue with Facebook',
                    buttonIcon: Assets.iconsFacebookIcon),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
