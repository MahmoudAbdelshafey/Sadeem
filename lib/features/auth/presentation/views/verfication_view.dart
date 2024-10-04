import 'package:flutter/material.dart';

import '../../../../core/main_widgets/auth_top_design.dart';
import '../../../../core/main_widgets/custom_sliver_app_bar.dart';
import 'widgets/verfication_body_form.dart';

class VerficationViewMobileLayOut extends StatelessWidget {
  const VerficationViewMobileLayOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          const SliverToBoxAdapter(
            child: AuthTopWidget(designTitle: 'Verfication'),
          ),

           VerficationForm()
        ],
      ),
    );
  }
}
