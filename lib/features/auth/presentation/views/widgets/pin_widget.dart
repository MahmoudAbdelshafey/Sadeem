import 'package:flutter/material.dart';

import '../../../../../core/utils/text_form_field_styles.dart';


class Pin_Widget extends StatelessWidget {
  const Pin_Widget({super.key, required this.last, required this.first,required this.controller});
final bool first;
final bool last;
final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 40, maxHeight: 40),
      child: Flexible(
        child: TextFormField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          controller: controller,
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(fontSize: 20,),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: pinInputDecoration,
          validator: (data){
            if(data!.trim().isEmpty ||data ==''){
              return '';
            }
            return null;

          },
        ),
      ),
    );
  }
}


