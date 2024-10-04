import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sadeem_application/features/map/views/widgets/planet_widget.dart';

import '../../../generated/assets.dart';

class StarsDetails extends StatefulWidget {
  const StarsDetails({Key? key}) : super(key: key);

  @override
  State<StarsDetails> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<StarsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff1E72BA),
                  Color(0xff2c1f6e)
                ]
            )
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 110),
                child: Image.asset(Assets.starsImg, fit: BoxFit.contain,),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, color: Theme.of(context).canvasColor,),
                      )
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const Text("Space\nExplorer", style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                        ),),
                        Expanded(
                          child: CarouselSlider(
                            options: CarouselOptions(
                                autoPlay: false,
                                aspectRatio: 1.0,
                                enlargeCenterPage: true,
                                viewportFraction: 0.6
                            ),
                            items: [
                              PlanetWidget("Mars", Assets.starsStartemp, "mars description"),
                              PlanetWidget("Earth", Assets.starsStartemp, "The third planet from the sun and the only astronomical thing that...."),
                              PlanetWidget("Venus", Assets.starsStartemp, "venus description"),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
