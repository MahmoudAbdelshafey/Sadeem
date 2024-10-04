import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import '../../../../core/main_cubits/theme/theme_cubit.dart';
import '../../../../core/main_widgets/browse_animation.dart';
import '../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../../change_language_feature/presentation/view/change_language.dart';
import '../../../change_password_feature/presentation/view/change_password.dart';
import '../../../edit_Profile_Feature/presentation/view/edit_Profile_Feature.dart';
import 'widgets/custom_Profile_Settings_widget.dart';
import 'widgets/custom_male_or_female_image.dart';

class ProfileFeature extends StatelessWidget {
  const ProfileFeature({super.key});

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const BrowseAnimation(
            title: 'Profile',
          ),
          SliverList(
              delegate: SliverChildListDelegate([
             CustomMaleOrFemaleImage(
              accountName: "Hello Astronaut",
              isMale: true,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomProfileSettingsWidget(
                    customText: 'Edit Profile',
                    rowIcon: Icons.edit,
                    iconBackgroundColor: Theme.of(context).primaryColor,
                    buttonFunction: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: EditProfileView(),
                          ));
                    },
                    hasSwitch: false,
                  ),
                  CustomProfileSettingsWidget(
                    iconBackgroundColor: Theme.of(context).primaryColor,
                    customText: 'Change Password',
                    rowIcon: Icons.lock,
                    buttonFunction: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const ChangePasswordFeature(),
                          ));
                    },
                    hasSwitch: false,
                  ),
                  CustomProfileSettingsWidget(
                    iconBackgroundColor: Theme.of(context).primaryColor,
                    customText: 'Languages',
                    rowIcon: Icons.language,
                    buttonFunction: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: const ChangeLanguageFeature(),
                          ));
                    },
                    hasSwitch: false,
                  ),
                  CustomProfileSettingsWidget(
                    iconBackgroundColor: Theme.of(context).primaryColor,
                    customText: 'themes',
                    rowIcon: Icons.sunny,
                    buttonFunction: () {},
                    switchFun: (isDark) {
                      context.read<ThemeCubit>().toggleTheme(!isDark);
                    },
                    hasSwitch: true,
                    isDarkMode: !isDark,
                  ),
                  CustomProfileSettingsWidget(
                    iconBackgroundColor: Theme.of(context).primaryColor,
                    customText: 'Help',
                    rowIcon: Icons.help,
                    buttonFunction: () {},
                    hasSwitch: false,
                  ),
                  CustomProfileSettingsWidget(
                    customText: 'Log OUt',
                    rowIcon: Icons.logout,
                    buttonFunction: () {
                      BlocProvider.of<AuthCubit>(context).signOut(context);
                    },
                    hasSwitch: false,
                    iconColor: Colors.white,
                    hasPostfix: false,
                    iconBackgroundColor: Colors.red,
                  ),
                ],
              ),
            ),
          ])),
        ],
      ),
    );
  }
}
