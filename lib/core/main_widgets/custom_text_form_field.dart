import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
   CustomTextFormField({super.key,  this.hintText,
    this.onChangedFun,
    this.isPassword = false,  this.preIcon,  this.suffexIcon, required this.labelText, required this.MyController});
  final String? hintText;
  final String labelText;
  final IconData? preIcon;
  final IconData? suffexIcon;
  final bool isPassword;
  final TextEditingController MyController;
   void Function(String)? onChangedFun;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();

}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool PasswordShown = false;
  FocusNode _focus = FocusNode();
  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {

    });  }

  @override
  Widget build(BuildContext context) {

    return   Material(
      elevation: _focus.hasFocus? 10:0,
      borderRadius: BorderRadius.circular(10),
      shadowColor: Colors.grey.withOpacity(0.6),

      child: TextFormField(
          focusNode: _focus,
          onFieldSubmitted: widget.onChangedFun,
          controller:widget.MyController ,
          validator: (data){
            if(data!.trim().isEmpty || data == null ||data ==''){
              return 'This Field is Required';
            }

          },
          obscureText: widget.isPassword &&!PasswordShown,
          cursorColor: Theme.of(context).primaryColor,
          style: AppStyles.styleRobotoRegular16(context),
          decoration: InputDecoration(
            fillColor: Colors.white,
              filled: true,
              isDense: true,
              errorMaxLines: 1,
              // errorText: '',
              errorStyle: const TextStyle(
                color: Colors.transparent,
                fontSize: 0,
              ),
              errorBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder:  OutlineInputBorder(
                  borderSide:  BorderSide(color:Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10)),
              focusedBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                  borderSide:  BorderSide(color: Theme.of(context).primaryColor,)),
              disabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                  borderSide:  BorderSide(color: Theme.of(context).primaryColor)),
              hintText: widget.hintText,
              hintStyle:   AppStyles.styleRobotoMedium17(context),
              label:   Text(
                widget.labelText,
              ),
              labelStyle: AppStyles.styleRobotoSemiBold16(context),

              prefixIcon: GestureDetector(
                child: Container
                  (
                    child:  Icon(
                      widget.preIcon,
                      size: 26,
                      color: Colors.black,
                    )),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              suffixIcon: Visibility(
                visible: widget.isPassword,
                child: Container(
                    margin: const EdgeInsets.only(right: 10, ),
                    child:  IconButton(
                      icon: Icon(
                        widget.isPassword &&!PasswordShown ? widget.suffexIcon : Icons.visibility_off,
                        size: 28,
                        color: Colors.black,
                      ),
                      onPressed: (){
                        PasswordShown = !PasswordShown;
                        setState(() {

                        });
                      },

                    )),
              ))),

    );
  }
}