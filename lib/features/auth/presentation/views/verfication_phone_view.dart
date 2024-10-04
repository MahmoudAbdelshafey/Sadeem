import 'package:flutter/material.dart';

import '../../../../core/main_widgets/auth_top_design.dart';
import '../../../../core/main_widgets/custom_sliver_app_bar.dart';
import 'widgets/verfication_phone_body_form.dart';

class VerficationViewMobileLayOutPhone extends StatelessWidget {
  const VerficationViewMobileLayOutPhone({super.key, required this.finalOtp});
final String finalOtp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          const SliverToBoxAdapter(
            child: AuthTopWidget(designTitle: 'Verfication'),
          ),

          VerficationPhoneForm(finalOtp: finalOtp,)
        ],
      ),
    );
  }
}
