import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rich_text_widget.dart';

class ResendButtonWithTimer extends StatefulWidget {
  const ResendButtonWithTimer({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<ResendButtonWithTimer> createState() => _ResendButtonWithTimerState();
}

class _ResendButtonWithTimerState extends State<ResendButtonWithTimer> {
  String currentSecond = '60';
  bool isCountDown = false;

  void initTimer() {
    setState(() {
      isCountDown = true;
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        currentSecond = '${int.parse(currentSecond) - 1}';
      });
      if (int.parse(currentSecond) > 0) {
        initTimer();
      } else {
        setState(() {
          isCountDown = false;
          currentSecond = '60';
        });
      }
    });
  }

  @override
  void initState() {
    initTimer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      // color: Colors.red,
      child: RichTextButton(
        alignment: Alignment.bottomLeft,
        color1: isCountDown == false ? Theme.of(context).primaryColor : Colors.grey,
        text2: isCountDown == false ? '' : '${currentSecond}s',
        color2: Theme.of(context).primaryColor,
        onPressed1: () {
          if (isCountDown == false) {
            initTimer();
            print('++++++++++++++++++++++++++++++++++++++++++');
            print('clicked');
          }
        },
      ),
    );
  }
}
