import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:sadeem_application/features/constilation/data/constilation_model.dart';

part 'constilation_state.dart';

class ConstilationCubit extends Cubit<ConstilationState> {
  ConstilationCubit() : super(ConstilationInitial());
  List<ConstilationModel> Constilations = [];
  final dio = Dio();


  getcubitStars() async{
    final response = await dio.get('https://63b9-156-195-32-125.ngrok-free.app/');
    Constilations = [];
    for(int i = 0; i<response.data['data'].length; i++){
      Constilations.add(ConstilationModel.fromjson(response.data['data'][i]));
    }
    print(Constilations);


  }
}
