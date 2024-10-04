import 'package:flutter/material.dart';


import '../../../../core/main_widgets/browse_animation.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import 'widgets/Custom_Lang_Item.dart';

class ChangeLanguageFeature extends StatefulWidget {
 const ChangeLanguageFeature({super.key});

  @override
  State<ChangeLanguageFeature> createState() => _Change_Language_FeatureState();
}

class _Change_Language_FeatureState extends State<ChangeLanguageFeature> {
  bool engLishLanguage = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Container(
        // decoration: const BoxDecoration(
        //         image: DecorationImage(image: AssetImage(Assets.imagesResetBack),fit: BoxFit.cover),
        //       ),
        child: CustomScrollView(
          slivers: [
          const  BrowseAnimation(
              title: 'Language',
              withBack: false,
              hasLeadingIcon: true,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('choose your language', style: AppStyles.styleRobotoSemiBold40(context)),
                          ],
                        ),
                      const  SizedBox(height: 30,),
                        GestureDetector(
                            onTap: (){
                              if(engLishLanguage){
                                engLishLanguage = !engLishLanguage;
                                setState(() {

                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: CustomLangItem(langSelected: !engLishLanguage,language: 'Arabic',),
                            )),
                      const  SizedBox(height: 20,),
                        GestureDetector(
                            onTap: (){
                              if(!engLishLanguage){
                                engLishLanguage = !engLishLanguage;
                                setState(() {

                                });
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: CustomLangItem(langSelected: engLishLanguage,language: 'English',),
                            )),


            ]))


          ],
        ),
      ),
    );

  }
}
