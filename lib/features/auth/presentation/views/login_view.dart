import 'package:flutter/material.dart';

import '../../../../core/main_widgets/auth_top_design.dart';
import '../../../../core/main_widgets/custom_sliver_app_bar.dart';
import 'widgets/login_form.dart';




class LoginViewMobileLayOut extends StatelessWidget {
  const LoginViewMobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height*1,
        child: CustomScrollView(
        clipBehavior: Clip.hardEdge,
          slivers: [

            const CustomSliverAppBar(),
            const SliverToBoxAdapter(
              child:AuthTopWidget(designTitle: 'Login') ,
            ),
              LoginForm(),


          ],

        ),
      ),
    );
  }
}

