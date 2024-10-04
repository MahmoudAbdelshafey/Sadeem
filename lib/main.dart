import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/main_cubits/theme/theme_cubit.dart';
import 'features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/manager/authentication_cubit/authentication_cubit.dart';
import 'features/auth/presentation/manager/authentication_cubit/authentication_states.dart';
import 'features/auth/presentation/manager/calculating_results/calculation_result_cubit.dart';
import 'features/auth/presentation/manager/calculating_results/calculation_result_state.dart';
import 'features/auth/presentation/manager/maleOrFemalCubit/maleCubit.dart';
import 'features/auth/presentation/manager/maleOrFemalCubit/maleState.dart';
import 'features/map/views/map_home.dart';
import 'features/map/views/map_stars.dart';
import 'firebase_options.dart';
import 'sadeem_main_app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Gemini.reInitialize(apiKey: "AIzaSyDLCo1A2Ssddkcd8jkaFMJB9ovfqb3Mtl0", enableDebugging: false);

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );


  final bool isOnboardingCompleted = await checkOnboardingStatus();




  runApp(DevicePreview(
    enabled: false,

    builder: (context) => MultiBlocProvider(
      providers: [
          BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<SignUpDataCubit>(
          create: (context) => SignUpDataCubit(SignUpDataInitial()),
        ),
        BlocProvider<MaleCubit>(
          create: (context) => MaleCubit(MaleStateInitial()),
        ),
        BlocProvider<CalculationResultCubit>(
          create: (context) => CalculationResultCubit(CalculatingResultInitial()),
        ),

      ],
      child:  SadeemApp(showOnBoarding: isOnboardingCompleted ,),
    ),
  ));
}
Future<bool> checkOnboardingStatus() async {
  final prefs = await SharedPreferences.getInstance();
  bool done =  await prefs.getBool('onboarding_completed')?? false;
  if(done){
    return true;

  }else{
    prefs.setBool('onboarding_completed', true);
  return false;
  }
}

class SadeemApp extends StatelessWidget {
  const SadeemApp({super.key , this.showOnBoarding = false});
  final bool showOnBoarding;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ThemeCubit, ThemeState>(

        builder: (context, state) {
          return  MaterialApp(
            theme: state.themeData ,
            debugShowCheckedModeBanner: false,
            home:  SadeemMainApp(showOnboarding:  showOnBoarding,),
            // home:  StarsDetails(),
          );
        }
    );
  }
}
