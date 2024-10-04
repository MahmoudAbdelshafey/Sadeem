import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:page_transition/page_transition.dart';
import 'package:sadeem_application/core/main_widgets/custom_text_form_field.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../verfication_view.dart';

class ForgetForm extends StatelessWidget {
  ForgetForm({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final forgetPasswordFormKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key: forgetPasswordFormKey,
        child: SliverList(
            delegate: SliverChildListDelegate(
          [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Your Code',
                  style: AppStyles.styleRobotoSemiBold22(context),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'enter your Email to get otp',
                  style: AppStyles.styleRobotoRegular14(context)
                      .copyWith(color: Theme.of(context).cardColor),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // PhoneTextFormField(
            //   phonNumber: phoneController,
            //   itemColor: Theme.of(context).primaryColor,
            // ),
            CustomTextFormField(labelText: 'Email', MyController: phoneController,preIcon: Icons.email,),
            const SizedBox(
              height: 40,
            ),
            CustomButtonWidget(
                buttonTitle: 'send',
                buttonFunction: () {
                  BlocProvider.of<AuthCubit>(context).sendPassResetLink();

                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const VerficationViewMobileLayOut(),
                      ));
                }),
          ],
        )),
      ),
    );
  }
}
