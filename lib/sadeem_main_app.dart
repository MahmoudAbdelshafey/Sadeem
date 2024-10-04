
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadeem_application/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';

import 'core/utils/adaptive_layout.dart';
import 'core/utils/size_config.dart';
import 'features/auth/presentation/views/landing_view.dart';
import 'features/auth/presentation/views/onboarding_page.dart';
import 'features/first_page.dart/home_page.dart';
import 'features/nav_bar/presentation/view/nav_bar_widget.dart';
import 'features/planet_animation/views/planet_home_widget.dart';

class SadeemMainApp extends StatefulWidget {
  const SadeemMainApp({super.key,  this.showOnboarding = false});
  final showOnboarding;
  @override
  State<SadeemMainApp> createState() => _DashBoradViewState();
}

class _DashBoradViewState extends State<SadeemMainApp> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {

    SizeConfig.init(context);
    return Scaffold(
      key: scaffoldKey,

      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges() ,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('waiting');
          }else if(snapshot.hasError){
            return Text('waiting');
          }else {

            if(snapshot.data == null){
              return AdaptiveLayout(
                mobileLayout: (context) => widget.showOnboarding ? const LandingViewMobileLayOut() :  const OnBoardingFeature(),
                tabletLayout: (context) => const SizedBox(),
                desktopLayout: (context) => const SizedBox(),
              );
            }else {
              return const NavBarViews();
              //  return PlanetExploreHome();

            }

          }
        },


      ),
    );
  }
}
