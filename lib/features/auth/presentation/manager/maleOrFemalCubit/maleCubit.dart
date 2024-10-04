import 'package:flutter_bloc/flutter_bloc.dart';

import 'maleState.dart';

class MaleCubit extends Cubit<MaleState>{
  MaleCubit(super.initialState);

  bool isMale = true;

  void changeGender(){
    isMale = !isMale;
    if(isMale == true){
      emit(IsMales());
      print('male');
    }else {
      print('female');
      emit(IsFemales());
    }
  }


}