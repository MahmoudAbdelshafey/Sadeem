import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/main_widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_styles.dart';
import '../login_view.dart';

class ResetForm extends StatelessWidget {
   ResetForm({super.key});
  final TextEditingController resetPasswordController = TextEditingController();
  final TextEditingController resetConfirmPasswordController = TextEditingController();
  final resetFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key: resetFormKey,
        child: SliverList(
            delegate: SliverChildListDelegate(
              [

                const SizedBox(
                  height: 40,
                ),
                 Text(
                  'your password must be different\n from your last password',
                  style: AppStyles.styleRobotoRegular14(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomTextFormField(
                  labelText: 'Password',
                  hintText: '********',
                  isPassword: true,
                  preIcon: Icons.lock,
                  MyController: resetPasswordController,
                  suffexIcon: Icons.remove_red_eye,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  labelText: 'Confirm Password',
                  hintText: '********',
                  isPassword: true,
                  preIcon: Icons.lock,
                  MyController: resetConfirmPasswordController,

                  suffexIcon: Icons.remove_red_eye,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                  buttonFunction: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: const LoginViewMobileLayOut(),
                        ),(route) => false,);

                  },
                 buttonTitle: 'Continue',
                ),

              ],
            )),
      ),
    );

  }
}
