import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomProfileSettingsWidget extends StatefulWidget {
   CustomProfileSettingsWidget(
      {super.key,
      required this.customText,
      required this.rowIcon,
      required this.buttonFunction,
      required this.hasSwitch,
      this.hasPostfix = true,
     required this.iconBackgroundColor ,
      this.iconColor , this.isDarkMode = false, this.switchFun });

  final String customText;
  final IconData rowIcon;
  final VoidCallback buttonFunction;
  final bool hasSwitch;
  final bool hasPostfix;
  final Color iconBackgroundColor;
   Color? iconColor;
  final bool isDarkMode;
   void Function(bool)? switchFun;

  @override
  State<CustomProfileSettingsWidget> createState() => _CustomProfileSettingsWidgetState();
}

class _CustomProfileSettingsWidgetState extends State<CustomProfileSettingsWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(247, 247, 247, 1),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.iconBackgroundColor),
            child: Icon(widget.rowIcon, color: widget.iconColor?? Theme.of(context).canvasColor,),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.customText,
            style: AppStyles.styleInterSemiBold18(context),
          ),
          const Spacer(),

          widget.hasSwitch? Switch(
            value: widget.isDarkMode,
            onChanged: widget.switchFun,
            activeColor: Theme.of(context).primaryColor,
            thumbColor: const MaterialStatePropertyAll(Colors.white),
          )  : GestureDetector(
              onTap: widget.buttonFunction,
              child:   Icon(Icons.arrow_forward_ios_rounded,color: Theme.of(context).cardColor,))



        ],
      ),
    );
  }
}
