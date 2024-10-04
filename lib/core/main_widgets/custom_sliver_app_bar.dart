import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import '../../generated/assets.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SliverAppBar(
          elevation: 0,
          toolbarHeight: 50,
          backgroundColor: Theme
              .of(context)
              .primaryColor,

          flexibleSpace: Image(
            image: AssetImage(Assets.imagesWal2, ),
            fit: BoxFit.fill,
          ),

          leading: IconButton(
            icon:  Icon(Icons.arrow_back_ios, color: Theme.of(context).canvasColor,),
            onPressed: () {
              Navigator.pop(context);
              print('clicked');

            },
          ),
        );
      },
    );
  }
}
