import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/assets.dart';

import '../../../data/card_model.dart';
import '../../views/screens/calculating_results.dart';
import '../../views/screens/what_brings_you_here.dart';
import '../../views/screens/what_your_gender.dart';
import 'authentication_states.dart';

class SignUpDataCubit extends Cubit<SignUpState>{
  SignUpDataCubit(super.initialState);
  final signUpCubitController = PageController();

 late double loadingCount = 1/screens.length;

  List<Card_Model> cardModels = [

    const Card_Model(cardIcon: Assets.iconsAppleIcon, cardDescription: 'small amount of data for young students', cardTitle: 'elementary School'),
    const Card_Model(cardIcon: Assets.iconsAppleIcon, cardDescription: 'more amount of data than elementary', cardTitle: 'middle School'),
    const Card_Model(cardIcon: Assets.iconsAppleIcon, cardDescription: 'full access of data ', cardTitle: 'high School'),
    const Card_Model(cardIcon: Assets.iconsAppleIcon, cardDescription: 'full access of data', cardTitle: 'multiple levels'),
  ];

//first Screen ( Enter Your Data)
  final TextEditingController currentWeigthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController kcalController = TextEditingController();
//finished data for first Screen


final TextEditingController targetWeigthController = TextEditingController();
  // person Data
  Map<String,dynamic> personData = {
    'currentWeight' : 40,
    'height' : 180,
    'kcal': 0,
    'Gender' : "Null",
    'WhatBringsYou' : "Null",
    'targetWeight': 60,
    'active': 'Null',
    'vegetarian' : false,
    'notPereferedMeals' : [],
    'planSelected' : 'Null' ,
  };


  final List<Widget> screens = [
   // const PersonDataScreen(),
    const GenderScreen(),
    const WhatBringsYouScreen(),
   //  const WhatIsYourTarget(),
   //  const HowActiveScreen(),
   //  const FoodpreferencesScreen(),
   //  const ChoosePlanScreen(),
   const CalculationResults(),
  ];

  // functions

  void goForwardScreen(){
    emit(SignUp_Changing_Screen());
print(personData);
    signUpCubitController.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn);
    emit(SignUp_Changing_Screen_finished());

  }

  void pageChanged (index){
    emit(SignUp_Changing_Screen());
    loadingCount= (index+1)/ screens.length;
    if(screens.length - 1 == index){
      emit(SignUp_Calculating_Resutls());
    }else if(screens.length - 2 == index){
      emit(SignUp_Choose_Plan());

    }else{
      emit(SignUp_To_Home());
    }
  }


  void goBackScreen(context ){
    if(loadingCount== (1/screens.length)){
      print('hei');
Navigator.pop(context);
    }
    emit(SignUp_Changing_Screen());

    signUpCubitController.previousPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeIn);
    emit(SignUp_Changing_Screen_finished());

  }

  void changePersonData(String changingVariable,int number){
    personData[changingVariable] = number;


  }


void increasePersonData(String changingVariable){
    emit(SignUp_Icrease());
      if(changingVariable == 'currentWeight'){
        if(currentWeigthController.text.isEmpty){
          currentWeigthController.text ='40';
        }
        if(int.parse(currentWeigthController.text) < 200){

        currentWeigthController.text=(int.parse(currentWeigthController.text)+10).toString();
        }
      }else if(changingVariable == 'height'){
        if(heightController.text.isEmpty){
          heightController.text ='180';
        }
        if(int.parse(heightController.text) < 220){

        heightController.text=(int.parse(heightController.text)+10).toString();
        }

      }else if(changingVariable == 'kcal'){
        if(kcalController.text.isEmpty){
          kcalController.text ='0';
        }
        if(int.parse(kcalController.text) < 4000){

          kcalController.text=(int.parse(kcalController.text)+100).toString();
        }

      }else{

        if(targetWeigthController.text.isEmpty){
          targetWeigthController.text = '60';
        }
        if(int.parse(targetWeigthController.text)<150){
          targetWeigthController.text = (int.parse(targetWeigthController.text)+10).toString();
        }

      }
    emit(SignUp_Icrease_finished());
}
void decreasePersonData(String changingVariable){
    emit(SignUp_Icrease());
      if(changingVariable == 'currentWeight'){
        if(currentWeigthController.text.isEmpty){
          currentWeigthController.text ='40';
        }
        if(int.parse(currentWeigthController.text) > 40){

        currentWeigthController.text=(int.parse(currentWeigthController.text)-10).toString();
        }
      }else if(changingVariable == 'height'){
        if(heightController.text.isEmpty){
          heightController.text ='180';
        }
        if(int.parse(heightController.text) > 110){

        heightController.text=(int.parse(heightController.text)-10).toString();
        }

      }else if(changingVariable == 'kcal'){
        if(kcalController.text.isEmpty){
          kcalController.text ='0';
        }
        if(int.parse(kcalController.text) > 10){

        kcalController.text=(int.parse(kcalController.text)-100).toString();
        }

      }else{

        if(targetWeigthController.text.isEmpty){
          targetWeigthController.text = '40';
        }
        if(int.parse(targetWeigthController.text)>40){
          targetWeigthController.text = (int.parse(targetWeigthController.text)-10).toString();
        }

      }
    emit(SignUp_Icrease_finished());
}

void submitData (){
    try {
      if(currentWeigthController.text.isNotEmpty || heightController.text.isNotEmpty ){
        personData['currentWeight'] = int.parse(currentWeigthController.text);
        personData['height'] = int.parse(heightController.text);
        if(kcalController.text.isNotEmpty){
          personData['kcal'] = int.parse(kcalController.text);
        }else{
          personData['kcal'] = 0;
        }

        goForwardScreen();
      }else{
        print('please Enter Data');
      }
    } on Exception catch (e) {
      print('please Enter Data the catch worked');
    }

}


void changeGender(bool ismale){
    if(ismale){
      personData['Gender'] = 'Male';
    }else{
      personData['Gender'] = 'Female';
    }
    goForwardScreen();
}


void setWhatBringsYouHere(String theTarget){
    personData['WhatBringsYou'] = theTarget;
    goForwardScreen();
}

void setTargetWeight(){
    
    if(targetWeigthController.text.isNotEmpty){
      personData['targetWeight'] = int.parse(targetWeigthController.text);
      goForwardScreen();
    }else{
      print('Please Enter Some Data');
    }
    
}

  void setHowActive(String theTarget){
    personData['active'] = theTarget;
    goForwardScreen();
  }


  void completeSignUp(){
    print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    print(personData);
    currentWeigthController.dispose();
    targetWeigthController.dispose();
    heightController.dispose();
    kcalController.dispose();
    goForwardScreen();
  }

}