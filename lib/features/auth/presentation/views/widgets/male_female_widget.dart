import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_styles.dart';

class Male_Female_Widget extends StatelessWidget {
  const Male_Female_Widget({super.key, required this.image, required this.title,required this.selected});
final String title;
final String image;
final bool selected;

  @override
  Widget build(BuildContext context) {

    return  ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 200,maxWidth: 500),
      child: AspectRatio(
        aspectRatio: 100/230,
        child: Container(
      
          decoration: BoxDecoration(
            borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: Column(
            children: [
              Container(
               padding: EdgeInsets.symmetric(vertical: 40),
                decoration: selected ? BoxDecoration(
                  color:Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ) : BoxDecoration(
                  color:const Color.fromRGBO(239, 239, 239, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AspectRatio(


                        aspectRatio: 80/80,
                        child: Image.asset(image))
                  ],
                ),
              ),
              const Spacer(),
              Text(title,style: AppStyles.styleRobotoBold24(context)),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
