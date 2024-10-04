import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../core/main_widgets/custom_button.dart';
import '../../../../../core/utils/app_styles.dart';

import 'pin_form.dart';
import 'resend_timer.dart';


class VerficationPhoneForm extends StatefulWidget {
  VerficationPhoneForm({super.key, required this.finalOtp});
final String finalOtp;
  @override
  State<VerficationPhoneForm> createState() => _VerficationPhoneFormState();
}

class _VerficationPhoneFormState extends State<VerficationPhoneForm> {

  late final  TextEditingController first;
  late final  TextEditingController second;
  late final  TextEditingController third;
  late final  TextEditingController fourth;
  late final  TextEditingController fifith;
  late final  TextEditingController sixth;
  final verficationFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    first = TextEditingController();

    third = TextEditingController();

    fourth = TextEditingController();

    second = TextEditingController();

    fifith = TextEditingController();

    sixth = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    first.dispose();
    second.dispose();
    third.dispose();
    fifith.dispose();
    fourth.dispose();
    sixth.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: Form(
        key: verficationFormKey,
        child: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(
                  height: 50,
                ),

                 Text(
                  'Get your code',
                  style: AppStyles.styleRobotoSemiBold22(context),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                  'please enter the 4 digit code\n that sent to your Phone Number',
                  style: AppStyles.styleRobotoRegular14(context) ,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                 PinForm(fifth: fifith,first:  first, fourth: fourth,second:  second,sixth:  sixth, third: third,),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'didn’t receive code ? ',
                      style: AppStyles.styleRobotoRegular14(context).copyWith(
                        color: Colors.black.withOpacity(0.6)
                      ),
                    ),
                    ResendButtonWithTimer(
                      onPressed: () {
                        print(
                            '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ Clicked');
                        print('test');
                      },

                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButtonWidget(
                    buttonTitle: 'Verify',
                    buttonFunction: () async {
                      try{
                        String otp = "${first.text}" + "${second.text}" + "${third.text}" + "${fourth.text}" + "${fifith.text}" + "${sixth.text}";
                        print(otp);
                    final cred = PhoneAuthProvider.credential(verificationId: widget.finalOtp, smsCode: otp);

                    await FirebaseAuth.instance.signInWithCredential(cred);
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              // child: const SignUpDataFeature(),
                              child: const SizedBox(),
                            ));
                      } catch(e){
                            print(e);
                      }



                    }),
              ],
            )),
      ),
    );

  }
}