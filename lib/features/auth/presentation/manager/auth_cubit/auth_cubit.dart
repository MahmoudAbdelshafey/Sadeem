import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../views/sign_up_data.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
//
  final _auth = FirebaseAuth.instance;
  UserCredential? currentUser;
  // UserModel? curUser;

  String? Token;
//
//   final dio = Dio();
//   PhoneNumber number = PhoneNumber(isoCode: 'SA');
//
  Future<void> createUserWithEmailAndPassword(
      {required email,
      required password,
      required context,
      required fname,
      required phoneNumber,
      required lName}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      currentUser = userCredential;

      navigateToRegister(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        final snakbar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'weak-password',
            message:
            'Try Make Password Stronger',

            contentType: ContentType.failure,
          ),
        );
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(snakbar);
      } else if (e.code == 'email-already-in-use') {
        final snakbar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'email-already-in-use',
            message:
            'Try Using Another Email',

            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snakbar);
      }
    } catch (e) {
      final snakbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Something WentWrong',
          message:
          'Please Try Again Later',

          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snakbar);
    }
  }

//   // Future<void> verfiyPhoneNumber({required context}) async{
//   //
//   //
//   //   FirebaseAuth.instance.verifyPhoneNumber(
//   //     phoneNumber: number.phoneNumber,
//   //       verificationCompleted: (phoneAuthCredential) {
//   //
//   //       },
//   //       verificationFailed: (error) {
//   //         print(error);
//   //       },
//   //       codeSent: (verificationId, forceResendingToken) {
//   //         Navigator.push(
//   //             context,
//   //             PageTransition(
//   //               type: PageTransitionType.fade,
//   //               child:  VerficationViewMobileLayOutPhone(finalOtp: verificationId,),
//   //             ));
//   //       },
//   //       codeAutoRetrievalTimeout: (verificationId) {
//   //         print('TimeOut');
//   //       },);
//   // }
//
  Future<User?> loginUserWithEmailAndPassword(
      {required email, required password, required context}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      currentUser = userCredential;
      final snakbar = SnackBar(
        elevation: 0,

        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Welcome',
          message:
          'Login Successfully',

          contentType: ContentType.success,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snakbar);
      navigateToHome(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        final snakbar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'user-not-found',
            message:
            'No user found for that email.',

            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snakbar);
      } else if (e.code == 'wrong-password') {
        final snakbar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            title: 'wrong-password',
            message:
            'Wrong password provided for that user.',

            contentType: ContentType.failure,
          ),
        );
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(snakbar);
      }
    } catch (e) {
      final snakbar = SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Something Wrong',
          message:
          'Please Try Again Later',

          contentType: ContentType.failure,
        ),
      );
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snakbar);
    }
  }

  Future<UserCredential?> signInWithGoogle(context) async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // navigateToHome(context);
      // Once signed in, return the UserCredential
      currentUser =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // loginWithSocial(
      //     Token: credential.idToken,
      //     email: currentUser!.user!.email,
      //     uId: currentUser!.user!.uid,
      //     Medium: 'Google');

      return currentUser;
    } catch (e) {}
  }

  Future<void> signOut(context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await _auth.signOut();

      currentUser = null;
      Token = null;
      savePersonData(fname: '',lName: '');
      prefs.setString("token", '');
    } catch (e) {
      print('Function SignOut error');
    }
  }

  Future<UserCredential?> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      currentUser = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);

      return currentUser;
    } catch (e) {
      print('error + {$e}');
    }
  }

  Future<UserCredential?> singInWithApple() async {
    try {
      final credintaial = SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName
      ]);
    } catch (e) {
      print('error + {$e}');
    }
  }

//   // verifyPhoneNumber(phoneController,){
//   //   // FirebaseAuth.instance.verifyPhoneNumber(verificationCompleted: verificationCompleted, verificationFailed: verificationFailed, codeSent: codeSent, codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//   // }
//
   Future<void> sendPassResetLink() async {
     try {
       await _auth.sendPasswordResetEmail(
           email: 'Mahmoud.abdelshafey571@gmail.com',
           actionCodeSettings:
               ActionCodeSettings(handleCodeInApp: true, url: ''));
     } catch (e) {}
  }

  void navigateToHome(context) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        // child: const NavBarViews(),
        child: const SizedBox(),
      ),
      (route) => false,
    );
  }
//
//   void navigateToLanding(context) {
//     Navigator.pushAndRemoveUntil(
//       context,
//       PageTransition(
//         type: PageTransitionType.fade,
//         child: const LandingViewMobileLayOut(),
//       ),
//       (route) => false,
//     );
//   }
//
  void navigateToRegister(context) {
    Navigator.push(
        context,
        PageTransition(
          type: PageTransitionType.fade,
          // child: const SizedBox(),
          child: const SignUpDataFeature(),
        ));
  }
// //  Apisss
//
//   loginWithSocial(
//       {required String? Token,
//       required String? Medium,
//       required String? uId,
//       required String? email}) async {
//     final response = await dio.post(
//       'https://restaurant.3elnet.com/api/v1/auth/social-customer-login',
//       data: {
//         'token': Token,
//         'unique_id': uId,
//         'medium': Medium,
//         'email': email
//       },
//     );
//   }
//
//   signUp(
//       {required fname,
//       required lName,
//       required phoneNumber,
//       required password,
//       required email}) async {
//     final response = await dio.post(
//       'https://restaurant.3elnet.com/api/v1/auth/registration',
//       data: {
//         'f_name': fname,
//         'l_name': lName,
//         'phone': number.phoneNumber,
//         'email': email,
//         'password': password
//       },
//     );
//   }
//
//   login({required password, required email}) async {
//     final response = await dio.post(
//       'https://restaurant.3elnet.com/api/v1/auth/login',
//       data: {'email_or_phone': email, 'password': password},
//     );
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     Token = response.data['token'];
//     prefs.setString("token", Token!);
//     print("After Login Token is : $Token");
//     getCurrentUser(response.data['token']);
//     return response.data['token'];
//   }
//
//   getCurrentUser(String tokenInput) async {
//      // print(tokenInput);
//   try{
//     if( tokenInput != null &&   tokenInput != '' ){
//
//       final response = await dio.get(
//         'https://restaurant.3elnet.com/api/v1/customer/info',
//         options: Options(
//             headers: {"authorization": "Bearer ${tokenInput}"}));
//     curUser = UserModel.fromJson(response.data);
//
//     savePersonData(lName: curUser!.lName, fname: curUser!.fName);
//     }
//   }catch(e){
//     print("hi");
//   }
//
//
//   }
//
  Future<void> savePersonData({
    required fname,
    required lName,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("User_fname", fname);
    prefs.setString("User_lname", lName);
  }

//   nameRetriever() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String? fname = await prefs.getString('User_fname');
//     String? lName = await prefs.getString('User_lname');
//     return "${fname} ${lName}";
//   }
//
//   EditProfile({required fname, required lName, required email, required context}) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = await prefs.getString('token');
//
//     final response = await dio.post(
//         'https://restaurant.3elnet.com/api/v1/customer/update-profile',
//         data: {
//           'f_name': fname,
//           'l_name': lName,
//           'phone': number.phoneNumber,
//           'email': email,
//           '_method': 'put'
//         },
//         options: Options(headers: {"authorization": "Bearer ${token}"}));
//     navigateToHome(context);
//   }
//
// void UpdatePassword({required context, required String Password}){
//     _auth.currentUser!.updatePassword(Password);
//
//    print(_auth.currentUser);
//     navigateToHome(context);
// }
}
