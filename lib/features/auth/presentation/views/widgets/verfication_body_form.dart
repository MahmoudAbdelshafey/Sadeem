import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/utils/app_styles.dart';
import '../reset_password_view.dart';
import 'pin_form.dart';
import 'resend_timer.dart';


class VerficationForm extends StatelessWidget {
   VerficationForm({super.key});


  TextEditingController first = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController second = TextEditingController();
  final verficationFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key: verficationFormKey,
        child: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 50,
                ),

                 Text(
                  'Put your code',
                  style: AppStyles.styleRobotoSemiBold22(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'please enter the 4 digit code\n that sent to your Phone Number',
                  style: AppStyles.styleRobotoRegular14(context) ,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                PinForm(first: first,second: second, third: third, fourth: fourth,fifth: first,sixth: second,),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'didn’t receive code ? ',
                      style: AppStyles.styleRobotoRegular14(context).copyWith(
                        color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                    ResendButtonWithTimer(
                      onPressed: () {
                        print(
                            '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Clicked');
                        print('test');
                      },

                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                    buttonTitle: 'Verify',
                    buttonFunction: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const ResetPasswordViewMobileLayOut(),
                          ));
                    }),
              ],
            )),
      ),
    );

  }
}