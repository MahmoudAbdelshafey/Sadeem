import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/main_widgets/browse_animation.dart';
import '../../../../core/main_widgets/custom_button.dart';
import '../../../../core/main_widgets/custom_text_form_field.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';

class EditProfileView extends StatelessWidget {
  EditProfileView({super.key});

  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email_Name = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

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
            const BrowseAnimation(title: 'EditProfile',hasLeadingIcon: true,withBack: true,),
            SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [


                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      'edit your profile data',
                      style: AppStyles.styleRobotoMedium20(context),
                    ),
                    Spacer(),
                    CustomTextFormField(
                      labelText: 'First Name',
                      MyController: firstName,
                      preIcon: Icons.person,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'Last Name',
                      MyController: lastName,
                      preIcon: Icons.person,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      labelText: 'Email',
                      MyController: email_Name,
                      preIcon: Icons.email,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButtonWidget(
                        buttonColor: Theme.of(context).primaryColor,
                        buttonTitle: 'Submit',
                        textColor: Theme.of(context).disabledColor,
                        buttonFunction: () {
                          // BlocProvider.of<AuthCubit>(context).EditProfile(fname: firstName.text, lName: lastName.text, email: email_Name.text,context: context);

                        }),
                    Spacer(
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

