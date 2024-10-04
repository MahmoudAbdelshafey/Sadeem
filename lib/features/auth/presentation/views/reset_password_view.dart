import 'package:flutter/material.dart';

import '../../../../core/main_widgets/auth_top_design.dart';
import '../../../../core/main_widgets/custom_sliver_app_bar.dart';
import 'widgets/reset_form.dart';


class ResetPasswordViewMobileLayOut extends StatelessWidget {
  const ResetPasswordViewMobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          const CustomSliverAppBar(),
          const SliverToBoxAdapter(
            child:AuthTopWidget(designTitle: 'Reset Password') ,
          ),
           ResetForm(),

        ],

      ),
    );
  }}

