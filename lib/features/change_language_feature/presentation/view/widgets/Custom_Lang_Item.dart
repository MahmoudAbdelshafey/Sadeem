import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomLangItem extends StatelessWidget {
  const CustomLangItem({super.key,required this.langSelected, required this.language});
final String language;
final bool langSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width *1,
      decoration: langSelected?BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ) :BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Theme.of(context).hintColor, width: 2)
      ),
      child: Row(
        children: [
          langSelected? const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.radio_button_checked,color: Colors.white,),
          ):  Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.radio_button_off, color: Theme.of(context).hintColor,),
          ),
          Text(language,style: AppStyles.styleRobotoMedium20(context).copyWith(fontSize: 18, color: const Color.fromRGBO(35, 31, 32, 1)),),
        ],
      ),
    );
  }
}
