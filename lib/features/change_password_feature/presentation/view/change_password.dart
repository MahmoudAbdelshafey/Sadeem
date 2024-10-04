import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/main_widgets/browse_animation.dart';
import '../../../../core/main_widgets/custom_button.dart';
import '../../../../core/main_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';

class ChangePasswordFeature extends StatefulWidget {
  const ChangePasswordFeature({super.key});

  @override
  State<ChangePasswordFeature> createState() => _ChangePasswordFeatureState();
}

class _ChangePasswordFeatureState extends State<ChangePasswordFeature> {
  late final TextEditingController lastPassword;

  late final TextEditingController newPassword;

  late final TextEditingController confirmPassword ;

  @override
  void initState() {
    // TODO: implement initState
    lastPassword = TextEditingController();
    newPassword = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    lastPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage(Assets.imagesResetBack), fit: BoxFit.cover),
          color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            const BrowseAnimation(title: 'Change Password',hasLeadingIcon: true,withBack: true,),

            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,

                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const Spacer( ),
                    Text(
                      'Enter New Password',
                      style:
                         AppStyles.styleRobotoSemiBold40(context),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'your password must be different from your last password',
                          style: AppStyles.styleRobotoMedium20(context),
                          textAlign: TextAlign.center,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextFormField(
                      labelText: 'Current Password',
                      preIcon: Icons.lock,
                      isPassword: true,
                      MyController: lastPassword,
                      suffexIcon: Icons.remove_red_eye,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'New Password',
                      preIcon: Icons.lock,
                      isPassword: true,
                      suffexIcon: Icons.remove_red_eye,
                      MyController: newPassword,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'Confirm Password',
                      preIcon: Icons.lock,
                      isPassword: true,
                      MyController: confirmPassword,
                      suffexIcon: Icons.remove_red_eye,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButtonWidget(
                        buttonColor: Theme.of(context).primaryColor,
                        buttonTitle: 'Create New Password',
                        textColor: Theme.of(context).disabledColor,
                        buttonFunction: () {

                          // BlocProvider.of<AuthCubit>(context).UpdatePassword(context: context, Password: newPassword.text);

                        }),
                    const Spacer(
                      flex: 4,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
