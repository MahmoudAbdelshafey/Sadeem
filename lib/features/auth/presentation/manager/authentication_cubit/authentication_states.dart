abstract class SignUpState{}

 class SignUp_Changing_Screen extends SignUpState{}
 class SignUp_Changing_Screen_finished extends SignUpState{}
 class SignUp_Choose_Plan extends SignUpState{}
class SignUp_Calculating_Resutls extends SignUpState{}
class SignUp_To_Home extends SignUpState{}

// states for the first Screen
class SignUpDataInitial extends SignUpState{}
class SignUp_Icrease extends SignUpState{}
class SignUp_Icrease_finished extends SignUpState{}


// states for the second screen (male or female)

class SignUpChangeGender extends SignUpState{}
class SignUpChangeGenderFinished extends SignUpState{}
class IsMale extends SignUpState{}
class IsFemale extends SignUpState{}
