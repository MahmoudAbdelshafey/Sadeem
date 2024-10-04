import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/main_widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../forget_password_view.dart';
import '../signup_view.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;
  late final TextEditingController passController;
  final loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.clear();
    emailController.dispose();
    passController.clear();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key: loginFormKey,
        child: SliverList(

            delegate: SliverChildListDelegate(

          [
            const SizedBox(
              height: 50,
            ),
            CustomTextFormField(
              labelText: 'e-mail',
              hintText: '@gmail.com',
              isPassword: false,
              preIcon: Icons.email,
              MyController: emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              labelText: 'Password',
              hintText: '********',
              isPassword: true,
              preIcon: Icons.lock,
              MyController:
              passController,
              suffexIcon: Icons.remove_red_eye,
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const ForgetPasswordView(),
                          ));

                    },
                    child: Text(
                      'forget password?',
                      style: AppStyles.styleRobotoRegular16(context)
                          .copyWith(color: Colors.black.withOpacity(0.8)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            CustomButtonWidget(
              buttonFunction: () {
              if(loginFormKey.currentState!.validate()){
                final user = BlocProvider.of<AuthCubit>(context).loginUserWithEmailAndPassword(
                  email: emailController.text, password: passController.text, context: context
                );



              }
              },

              buttonTitle: 'Login',
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t Have An Account?',
                  style: AppStyles.styleRobotoRegular14(context).copyWith(color: Theme.of(context).cardColor),
                ),
                GestureDetector(
                  child:  Text(' SignUp', style: AppStyles.styleRobotoSemiBold16(context).copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).cardColor),),
                  onTap: () {

                    Navigator.pushReplacement(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: const SignUpMobileLayOut(),
                    ));

                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        )),
      ),
    );
  },
);
  }
}
