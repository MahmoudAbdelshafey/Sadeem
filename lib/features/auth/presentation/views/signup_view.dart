import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/main_widgets/auth_top_design.dart';
import '../../../../core/main_widgets/custom_sliver_app_bar.dart';
import '../manager/auth_cubit/auth_cubit.dart';
import 'widgets/signup_form.dart';

class SignUpMobileLayOut extends StatelessWidget {
  const SignUpMobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),

          const SliverToBoxAdapter(
            child:AuthTopWidget(designTitle: 'SignUp') ,
          ),
          SignUpForm(),

        ],
      ),
    );
  }
}
