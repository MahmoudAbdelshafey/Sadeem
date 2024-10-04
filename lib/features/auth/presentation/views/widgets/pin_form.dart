import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pin_Widget.dart';

class PinForm extends StatelessWidget {
  const PinForm({super.key, required this.first, required this.sixth, required this.fourth, required this.third, required this.second, required this.fifth});

final TextEditingController first, second, third , fourth, fifth, sixth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pin_Widget(
          first: true,
          last: false,
          controller: first,
        ),
        const SizedBox(
          width: 20,
        ),
        Pin_Widget(
          first: false,
          last: false,
          controller: second,
        ),
        const SizedBox(
          width: 20,
        ),
        Pin_Widget(
          first: false,
          last: false,
          controller: third,
        ),
        const SizedBox(
          width: 20,
        ),

        Pin_Widget(
          first: false,
          last: false,
          controller: fourth,
        ),
        const SizedBox(
          width: 20,
        ),
        Pin_Widget(
          first: false,
          last: false,
          controller: fifth,
        ),
        const SizedBox(
          width: 20,
        ),
        Pin_Widget(
          first: false,
          last: true,
          controller: sixth,
        ),
      ],
    );
  }
}
