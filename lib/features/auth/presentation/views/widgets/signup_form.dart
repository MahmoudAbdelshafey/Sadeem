import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/main_widgets/custom_text_form_field.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../login_view.dart';

class SignUpForm extends StatefulWidget {
   SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController emailController;
  late final TextEditingController passController;
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController confirmPassController;
  final registerFormKey = GlobalKey<FormState>();
late  final TextEditingController phoneController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    confirmPassController = TextEditingController();
   phoneController =  TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.clear();
    phoneController.dispose();
    emailController.clear();
    emailController.dispose();
    passController.clear();
    passController.dispose();
    firstNameController.clear();
    firstNameController.dispose();
    lastNameController.clear();
    lastNameController.dispose();
    confirmPassController.clear();
    confirmPassController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AuthCubit, AuthState>(
  builder: (context, state) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key:  registerFormKey,
        child: SliverList(
          delegate: SliverChildListDelegate([
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              labelText: 'First Name',
              hintText: '',
              isPassword: false,
              preIcon: Icons.person,
              MyController:  firstNameController,

            ),

            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              labelText: 'Last Name',
              hintText: '',
              isPassword: false,
              preIcon: Icons.person,
              MyController: lastNameController,

            ),

            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              labelText: 'e-mail',
              hintText: '@gmail.com',
              isPassword: false,
              preIcon: Icons.email,
              MyController:  emailController,

            ),
            const SizedBox(
              height: 20,
            ),

            CustomTextFormField(
              labelText: 'Password',
              hintText: '********',
              isPassword: true,
              preIcon: Icons.lock,
              MyController:  passController,
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
              MyController:  confirmPassController,
              suffexIcon: Icons.remove_red_eye,

            ),
            const SizedBox(
              height: 30,
            ),

            CustomButtonWidget(
              buttonFunction: () {

                if(registerFormKey.currentState!.validate()){

                  if(passController.text == confirmPassController.text){

                  final user = BlocProvider.of<AuthCubit>(context).createUserWithEmailAndPassword( email: emailController.text, password: passController.text, context: context,lName: lastNameController.text, fname: firstNameController.text, phoneNumber: phoneController.text);
                  //   BlocProvider.of<AuthCubit>(context).verfiyPhoneNumber( context: context);
                  }


                }


              },
            buttonTitle: 'SignUp',
            ),
            const SizedBox(
              height: 20,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  'Already Have An Account?',
                  style: AppStyles.styleRobotoRegular14(context).copyWith(
                    color: Theme.of(context).cardColor,
                  ),
                ),
                GestureDetector(
                  child:  Text(' Login',style:  AppStyles.styleRobotoSemiBold16(context).copyWith(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).cardColor),),
                  onTap: () {



                    Navigator.pushReplacement(context, PageTransition(
                      type: PageTransitionType.fade,
                      child: const LoginViewMobileLayOut(),
                    ));
                  },
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),

          ]),
        ),
      ),
    );
  },
);
  }
}
