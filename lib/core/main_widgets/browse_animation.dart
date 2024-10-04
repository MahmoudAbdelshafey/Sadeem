import 'package:flutter/material.dart';

import '../../generated/assets.dart';


class BrowseAnimation extends StatelessWidget {
  const BrowseAnimation({super.key, required this.title , this.withBack = true, this.hasLeadingIcon = false});
  final String title;
  final bool withBack;
  final bool hasLeadingIcon;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 50,
      floating: false,

      backgroundColor: Colors.transparent,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Spacer(),
          Visibility(
              visible: hasLeadingIcon,
              child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child:  Icon(Icons.arrow_back_ios, color: Theme.of(context).canvasColor,))),
         const  Spacer(flex: 4,)
        ],
      ),



      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,

        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: withBack? const BoxDecoration(

                  image: DecorationImage(image: AssetImage(Assets.imagesWal2s),fit: BoxFit.fill)
              ) : const BoxDecoration(
                  image: DecorationImage(image: AssetImage(Assets.imagesWal2s),fit: BoxFit.fill)

              ),
            ),
            // withBack? SvgPicture.asset(Assets.imagesAppBar): const SizedBox(),
            Align(

              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 500),
                builder: (BuildContext context, double value,
                    Widget? child) {
                  return Transform.scale(
                    alignment: AlignmentDirectional.centerEnd,

                    scale: 1 + value,
                    child: Opacity(
                      opacity:
                      1 - value,
                      child: Text(
                        title,


                        style:  TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
