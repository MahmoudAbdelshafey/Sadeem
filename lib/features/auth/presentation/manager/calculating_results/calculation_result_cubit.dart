import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sadeem_application/features/first_page.dart/home_page.dart';
import 'package:sadeem_application/features/nav_bar/presentation/view/nav_bar_widget.dart';

import 'calculation_result_state.dart';

class CalculationResultCubit extends Cubit<CalculatingResult>{
  CalculationResultCubit(super.initialState);


  double loadCount = 1;
  int percent = 1;

  void startAnimation(double value){

    if(value*100 < 100){
      emit(CalculatingResultLoading());
      percent = (value*100).toInt()+1;
    }else{
      emit(CalculatingResultLoadingFinished());

    }

  }
  void gotoNavigate(context ){
    emit(CalculatingResultLoadingFinished());

    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          child: const NavBarViews(),
        ));

  }


}